package com.studygo.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.studygo.bean.*;
import com.studygo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.studygo.bean.Follow;
import com.studygo.utils.PathUtil;

@RequestMapping("/userController")
@SessionAttributes(value = {"username", "userid", "password", "email"})
@Controller
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    ArticleController articleController;
    @Autowired
    ArticleService articleService;
    @Autowired
    CommentController commentController;
    @Autowired
    CommentService commentService;
    @Autowired
    AvatarService avatarService;
    @Autowired
    FollowService followService;
    @Autowired
    FavoriteService favoriteService;
    @Autowired
    RankingService rankingService;

    /**
     * User login validation - ajax
     * @param user
     * @param map
     * @return
     */
    @RequestMapping(value = "/getLoginAjax")
    @ResponseBody
    public String getLoginAjax(User user, Map<Object, Object> map, HttpServletRequest request) {
        user.setName(request.getParameter("name"));
        user.setPassword(request.getParameter("password"));

        // Query by username and password
        List<User> listUser = userService.getUser(user);

        if (!listUser.toString().equals("[]")) {

            int userid = listUser.get(0).getUserid();
            String name = listUser.get(0).getName();
            String password = listUser.get(0).getPassword();
            String email = listUser.get(0).getEmail();

            map.put("userid", userid);
            map.put("username", name);
            map.put("password", password);
            map.put("email", email);

            return "OK";
        } else {
            return "NO";
        }
    }

    /**
     * Registration
     * @param user
     * @param map
     * @return
     */
    @RequestMapping("/setSignUp")
    @ResponseBody
    public String setSignUp(User user, Map<Object, Object> map, HttpServletRequest request) {
        user.setName(request.getParameter("name"));
        user.setPassword(request.getParameter("pass"));
        user.setEmail(request.getParameter("email"));
        // Determine if the user already exists
        if (userService.getUserName(user).toString().equals("[]") && request.getParameter("name") != "") {
            // Determine if the two passwords are the same
            if (request.getParameter("pass").equals(request.getParameter("repass"))) {
                userService.setUser(user);
                System.out.println("Registration successful");

                // Query by user id
                List<User> listUser = userService.getUserName(user);
                rankingService.setRanking(listUser.get(0));
                int userid = listUser.get(0).getUserid();
                String name = user.getName();
                String password = user.getPassword();
                String email = user.getEmail();

                map.put("userid", userid);
                map.put("username", name);
                map.put("password", password);
                map.put("email", email);
                return "OK";
            }
            return "PASS";
        } else {
            System.err.println("Registration failed");
            return "NO";
        }

    }

    /**
     * Signout
     * @param map
     * @return
     */
    @RequestMapping("/userExit")
    public String userExit(Map<Object, Object> map) {
        map.put("userid", "");
        map.put("username", "");
        return "redirect:/index.jsp"; // redirect
    }

    /**
     * Personal homepage
     * @return
     */
    @RequestMapping("/getMyself")
    public String getMyself(HttpSession session, Map<Object, Object> map, Map<Object, Object> map2) {
        int userid = (Integer) session.getAttribute("userid");

        /**
         * Query user info by userid
         */
        List<User> myListUser = userService.getUserId(userid);
        if (myListUser.get(0).getSex() == null) {
            myListUser.get(0).setSex("Secret");
        }
        if (myListUser.get(0).getIntro() == null) {
            myListUser.get(0).setIntro("None");
        }
        map.put("myListUser", myListUser.get(0));

        /**
         * Query article info by userid (news feed)
         */
        List<Article> myListArticles = articleService.getArticleId(userid);
        map.put("myListArticles", myListArticles);

        /**
         * Query comment info corresponding to each article by fid (news feed)
         */
        for (int i = 0; i < myListArticles.size(); i++) {
            // Extract the id corresponding to each article separately
            int fid = myListArticles.get(i).getFid();

            // Find the corresponding comment information by the id of each article
            commentController.getCommentFid(fid, map);
            // Store the corresponding comment information found in the previous step into listComment
            List<Comment> myListComment = (List<Comment>) map.get("listComment");
            System.out.println("myListComment-" + i + ":" + myListComment);

            // Preset a map for the map that changes with the post id
            String myListCommentFid = "myListComment_" + fid;
            // Save all comments corresponding to each article to the map (the key is changed as the article id changes)
            map.put(myListCommentFid, myListComment);

            // Save the map to map2
            map2.put("map", map);
        }

        /**
         * Qury comment info by userid (reply)
         */
        List<Comment> myComments = commentService.getCommentUserid(userid);
        map.put("myComments_reply", myComments);
        for (int i = 0; i < myComments.size(); i++) {

            // Extract the fid corresponding to each comment separately
            int fid = myComments.get(i).getFid();

            Article myArticle = articleService.getArticleKey(fid);
            System.out.println("myArticle:" + myArticle);

            map.put("myArticle_" + fid, myArticle);
            map2.put("map_reply", map);

            // Find the corresponding comment information by the id of each post.
            commentController.getCommentFid(fid, map);
            // Store the corresponding comment information found in the previous step into listComment
            List<Comment> myListComment_reply = (List<Comment>) map.get("listComment");
            System.out.println("myListComment_reply-" + i + ":" + myListComment_reply);

            // Preset a map for the map that changes with the post id
            String myListCommentFid_reply_fid = "myListComment_reply_" + fid;
            // Save all comments corresponding to each article to the map (the key is changed as the article id changes)
            map.put(myListCommentFid_reply_fid, myListComment_reply);

            // Save the map to map2
            map2.put("map_reply_p", map);
        }

        /**
         * Query follow info by userid (who you followed)
         */
        List<Follow> follows = followService.getFollow(userid);
        List<User> myListUserFollow = new ArrayList<User>();
        for (Follow follow : follows) {
            // Query user info by beuserid
            int beuserid = follow.getBeuserid();
            myListUserFollow.add(userService.getUserKey(beuserid));
        }
        map.put("myListFollows", myListUserFollow);

        /**
         * Query follow info by beuserid (who followed you)
         */
        List<Follow> follows_be = followService.getFollowBe(userid);
        List<User> myListUserFollow_be = new ArrayList<User>();
        for (Follow follow_be : follows_be) {
            // Query user info by user id
            myListUserFollow_be.add(userService.getUserKey(follow_be.getUserid()));
        }
        map.put("myListFollows_be", myListUserFollow_be);

        /**
         * Query favorite info by userid (the article favorite)
         */
        List<Favorite> favorites = favoriteService.getFavorite(userid);
        List<Article> myListArticleFavorite = new ArrayList<Article>();
        for (Favorite favorite : favorites) {
            // Query article info by fid
            int fid = favorite.getFid();
            myListArticleFavorite.add(articleService.getArticleKey(fid));
        }
        map.put("myListFavorites", myListArticleFavorite);

        return "myself";
    }

    /**
     * Others personal home page
     * @return
     */
    @RequestMapping("/getOthers")
    public String getOthers(@RequestParam(value = "userid") int userid, Map<Object, Object> map, Map<Object, Object> map2, HttpSession session) {

        // If the user is an already logged in user, go back to the "Personal Homepage"
        if (session.getAttribute("userid") != null && session.getAttribute("userid").equals(userid)) {

            return "redirect:/userController/getMyself";
        } else {

            /**
             * Query user information by userid
             */
            List<User> othersListUser = userService.getUserId(userid);
            if (othersListUser.get(0).getSex() == null) {
                othersListUser.get(0).setSex("Secret");
            }
            if (othersListUser.get(0).getIntro() == null) {
                othersListUser.get(0).setIntro("None");
            }
            map.put("othersListUser", othersListUser.get(0));

            /**
             * Query article info by userid
             */
            List<Article> othersListArticles = articleService.getArticleId(userid);
            map.put("othersListArticles", othersListArticles);

            /**
             * Query comment info corresponding to each article by fid
             */
            for (int i = 0; i < othersListArticles.size(); i++) {

                // Extract the id corresponding to each article separately
                int fid = othersListArticles.get(i).getFid();

                // Find the corresponding comment information by the id of each post.
                commentController.getCommentFid(fid, map);
                // Store the corresponding comment information found in the previous step into listComment
                List<Comment> othersListComment = (List<Comment>) map.get("listComment");
                System.out.println("othersListComment-" + i + ":" + othersListComment);

                // Preset a map for the map that changes with the article id
                String othersListCommentFid = "othersListComment_" + fid;
                // Save all comments corresponding to each post to the map (the key is changed as the article id changes)
                map.put(othersListCommentFid, othersListComment);

                // Save the map to map2
                map2.put("map", map);
            }
            return "others";
        }
    }

    /**
     * Edit profile (update user table)
     *
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public ModelAndView UpdateUser(User user) {

        System.out.println(user);
        userService.updateUser(user);
        // Redirect to the method getMyself
        return new ModelAndView("redirect:/userController/getMyself");
    }

    /**
     * Query user info (unconditional)
     * @param map
     */
    public void getUser(Map<Object, Object> map) {

        List<User> listUser = userService.getUser();
        System.out.println(listUser);
        map.put("listUser", listUser);
    }

    public void getUserId(int userid, Map<Object, Object> map) {

        List<User> listUserId = userService.getUserId(userid);
        map.put("listUserId", listUserId);
    }

    /**
     * Delete user (and its corresponding avatar information, comment information, post information, attention information)
     * @param user
     * @return
     * @throws IOException
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(User user, Map<Object, Object> map, HttpSession session, HttpServletRequest request) throws IOException {

        String projectname;    // project name
        projectname = request.getSession().getServletContext().getRealPath("/");
        projectname = projectname.substring(0, projectname.length() - 1);
        if (projectname.indexOf("/") == -1) {// Under non-linux OS
            projectname = projectname.substring(projectname.lastIndexOf("\\"), projectname.length());
        } else { // Under linux system
            projectname = projectname.substring(projectname.lastIndexOf("/"), projectname.length());
        }

        // File (picture) path
        String filePath = PathUtil.getCommonPath() + projectname + PathUtil.getUserPath();

        int userid = user.getUserid();

        // Delete user info (without avatar)
        userService.deleteUser(user);

        System.out.println(avatarService.getAvatar(userid));
        // The corresponding user with an avatar performs the following operations.
        if (avatarService.getAvatar(userid) != null) {

            // Obtain the file name of the avatar corresponding to the user to be deleted (acquire avatar info by userid)
            String fileName = avatarService.getAvatar(userid).getPhoto();
            System.out.println("File name：" + fileName);
            // Encapsulate the full path of the uploaded file location
            File targetFile = new File(filePath, fileName);
            System.out.println("Full file name：" + targetFile);

            // Delete the avatar corresponding to the user (actually deleted)
            targetFile.delete();

            // Delete the avatar information corresponding to the user (database)
            avatarService.deleteAvatar(userid);
        }

        // Delete all comment information corresponding to the user (by userid)
        commentService.deleteCommentUserid(userid);

        List<Article> listArticle = articleService.getArticleId(userid);
        System.out.println(listArticle);
        // The corresponding user who has posted the article performs the following operations.
        if (listArticle.toString() != "[]") {
            for (int i = 0; i < listArticle.size(); i++) {
                int fid = listArticle.get(i).getFid();
                articleController.articlePhotoDelete(fid, request);
            }
            // Delete the post information corresponding to the user (database)
            articleService.deleteArticleUserid(userid);
        }

        // Delete the follow information of the user
        followService.deleteFollowUseridOrBeUserid(userid);

        // Delete the favorite information corresponding to the user (by userid)
        favoriteService.deleteFavoriteUserid(userid);

        rankingService.deleteRankingUserid(userid);

        // If the currently logged in user is deleted, the corresponding session is emptied.
        if (session.getAttribute("userid") != null && session.getAttribute("userid").equals(userid)) {
            map.put("userid", "");
            map.put("username", "");
        }

        return "redirect:/admin/index.jsp";
    }


    /**
     * Modify the user information at the basic settings (e.g. username, password, email)
     * @param user
     * @param session
     * @param map
     * @return
     */
    @RequestMapping("/updateUserSetup")
    public ModelAndView updateUserSetup(User user, HttpSession session, Map<Object, Object> map) {

        boolean name = user.getName().equals(session.getAttribute("username"));
        boolean password = user.getPassword().equals(session.getAttribute("password"));
        boolean email = user.getEmail().equals(session.getAttribute("email"));
        Article article = new Article();
        article.setUserid(user.getUserid());
        article.setUsername(user.getName());

        if (name && password && email) {
            System.out.println("No changes to the information, no database modification work.");
        } else {
            // Update user table
            userService.updateUserSetup(user);
            // Update the username inside the article table
            articleService.updateArticleSetup(article);
            map.put("username", user.getName());
            map.put("password", user.getPassword());
            map.put("email", user.getEmail());
        }

        rankingService.updateRankingUsername(user.getName(), user.getUserid());

        // Redirect to the method getMyself
        return new ModelAndView("redirect:/userController/getMyself");
    }
}
