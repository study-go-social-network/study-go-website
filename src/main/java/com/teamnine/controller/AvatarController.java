package com.teamnine.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.teamnine.bean.Avatar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamnine.service.AvatarService;
import com.teamnine.utils.PathUtil;

@RequestMapping("/avatarController")
@Controller
public class AvatarController {

	@Autowired
	AvatarService avatarService;
	
	/**
	 * Upload user avatar (insert, modify)
	 * @param file
	 * @param session
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/setUserPhoto")
	public String setUserPhoto(@RequestParam("photo") MultipartFile file, HttpSession session,HttpServletRequest request) throws IOException {
		
		String projectname;	// project name
		projectname = request.getSession().getServletContext().getRealPath("/");
		projectname=projectname.substring(0,projectname.length()-1);
		if (projectname.indexOf("/")==-1) { // Under non-Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("\\"),projectname.length());
		} else { // Under Linux OS
			projectname = projectname.substring(projectname.lastIndexOf("/"),projectname.length());
		}

		// File (picture) path
		String filePath = PathUtil.getCommonPath()+projectname+PathUtil.getUserPath();
		
		// Store the newly generated file name (not repeated)
		String newFileName = null;
		int userid = (Integer) session.getAttribute("userid");
		Avatar avatar =new Avatar();
		avatar.setUserid(userid);
		
		// Get the file name and suffix of the uploaded image (get the extension of the original image)
		String fileName = file.getOriginalFilename();
		
		// If the user has not uploaded an avatar, then add a new operation
		if (avatarService.getAvatar(userid)==null) {
			
			// In the case where an avatar is selected
			if(!fileName.equals("")) {
				// Generate a new file name (not repeated)
				newFileName = UUID.randomUUID() + fileName;
				// Encapsulate the full path of the uploaded file location
				File targetFile = new File(filePath, newFileName);
				System.out.println(targetFile);
				// Upload local files to the package upload file location
				file.transferTo(targetFile);
				
				avatar.setPhoto(newFileName);
				// Save avatar to the database
				avatarService.setUserPhoto(avatar);
			}
			
		// If the user has uploaded an avatar, update it
		} else {

			// In the case where an avatar is selected
			if(!fileName.equals("")) {
				// Obtain the file name of the avatar corresponding to the user to be deleted (get avatar info by userid)
				String fileNameNew = avatarService.getAvatar(userid).getPhoto();
				// Encapsulate the full path of the uploaded file location
				File targetFile = new File(filePath, fileNameNew);
				System.out.println(targetFile);
				// Delete the image corresponding to the post (actually deleted)
				targetFile.delete();
				
				// Generate a new file name (not repeated)
				newFileName = UUID.randomUUID() + fileName;
				// Encapsulate the full path of the uploaded file location
				targetFile = new File(filePath, newFileName);
				// Upload local files to the package upload file location
				file.transferTo(targetFile);
				
				avatar.setPhoto(newFileName);
				// Save avatar to database (updated)
				avatarService.updateAvatar(avatar);
			}
		}
		
		return "redirect:/userController/getMyself";
	}
	
}
