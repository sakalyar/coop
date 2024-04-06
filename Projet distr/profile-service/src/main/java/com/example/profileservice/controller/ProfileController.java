package com.example.profileservice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.profileservice.model.UserProfileFields; // Import UserProfile
import com.example.profileservice.service.ProfileService; // Import ProfileService

@RestController
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @GetMapping("/{userId}")
    public ResponseEntity<UserProfileFields> getUserProfile(@PathVariable String userId) {
        UserProfileFields userProfile = profileService.UserProfileFields(userId);
        if (userProfile != null) {
            return ResponseEntity.ok(userProfile);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Other endpoints for profile management
}
