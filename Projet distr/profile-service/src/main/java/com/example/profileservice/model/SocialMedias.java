package com.example.profileservice.model;

public class SocialMedias {
    private String socialMediaId;
    private String name;
    private String url;

    public SocialMedias() {
        // Default constructor
    }

    public SocialMedias(String socialMediaId, String name, String url) {
        this.socialMediaId = socialMediaId;
        this.name = name;
        this.url = url;
    }

    public String getSocialMediaId() {
        return socialMediaId;
    }

    public void setSocialMediaId(String socialMediaId) {
        this.socialMediaId = socialMediaId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
