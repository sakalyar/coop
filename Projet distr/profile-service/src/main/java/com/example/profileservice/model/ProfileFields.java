package com.example.profileservice.model;

public class ProfileFields {
    private String profileFieldId;
    private String name;
    private String description;
    private String content;

    public ProfileFields() {
        // Default constructor
    }

    public ProfileFields(String profileFieldId, String name, String description, String content) {
        this.profileFieldId = profileFieldId;
        this.name = name;
        this.description = description;
        this.content = content;
    }

    public String getProfileFieldId() {
        return profileFieldId;
    }

    public void setProfileFieldId(String profileFieldId) {
        this.profileFieldId = profileFieldId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
