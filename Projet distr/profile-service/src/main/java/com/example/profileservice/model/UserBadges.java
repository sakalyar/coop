package com.example.profileservice.model;

public class UserBadges {
    private String badgeId; // Foreign key referencing Badges table
    private String userId; // Foreign key referencing Users table
    private String date;
    private int progress;
    
    public UserBadges() {
        // Default constructor
    }

    public UserBadges(String badgeId, String userId, String date, int progress) {
        this.badgeId = badgeId;
        this.userId = userId;
        this.date = date;
        this.progress = progress;
    }

    public String getBadgeId() {
        return badgeId;
    }

    public void setBadgeId(String badgeId) {
        this.badgeId = badgeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getProgress() {
        return progress;
    }

    public void setProgress(int progress) {
        this.progress = progress;
    }
}
