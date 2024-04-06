package com.example.profileservice.model;

public class UserSocialMedias {
    private String userId; // Foreign key referencing the user
    private String socialMediaId; // Foreign key referencing the social media platform
    private String profileLink;

    public UserSocialMedias() {
        // Default constructor
    }

    public UserSocialMedias(String userId, String socialMediaId, String profileLink) {
        this.userId = userId;
        this.socialMediaId = socialMediaId;
        this.profileLink = profileLink;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getSocialMediaId() {
        return socialMediaId;
    }

    public void setSocialMediaId(String socialMediaId) {
        this.socialMediaId = socialMediaId;
    }

    public String getProfileLink() {
        return profileLink;
    }

    public void setProfileLink(String profileLink) {
        this.profileLink = profileLink;
    }
}
