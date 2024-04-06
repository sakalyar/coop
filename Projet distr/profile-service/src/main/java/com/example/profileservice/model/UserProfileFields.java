package com.example.profileservice.model;

public class UserProfileFields {
    private String profileFieldId;
    private String userId; // Foreign key referencing the user
    private String content;

    public UserProfileFields() {
        // Default constructor
    }

    public UserProfileFields(String profileFieldId, String userId, String content) {
        this.profileFieldId = profileFieldId;
        this.userId = userId;
        this.content = content;
    }

    public String getProfileFieldId() {
        return profileFieldId;
    }

    public void setProfileFieldId(String profileFieldId) {
        this.profileFieldId = profileFieldId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
