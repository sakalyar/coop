package com.example.profileservice.model;

public class Badges {
    private String badgeId;
    private String name;
    private String description;

    public Badges() {
        // Default constructor
    }

    public Badges(String badgeId, String name, String description) {
        this.badgeId = badgeId;
        this.name = name;
        this.description = description;
    }

    public String getBadgeId() {
        return badgeId;
    }

    public void setBadgeId(String badgeId) {
        this.badgeId = badgeId;
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
}
