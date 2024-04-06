package com.example.profileservice.service;
import com.example.profileservice.model.UserProfileFields;

public interface ProfileService {
    UserProfileFields UserProfileFields(String userId);
    // Other methods for profile management
}
