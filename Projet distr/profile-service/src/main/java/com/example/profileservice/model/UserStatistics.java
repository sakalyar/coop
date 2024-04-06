package com.example.profileservice.model;

public class UserStatistics {
    private String userId; // Foreign key referencing the user
    private String statisticId; // Foreign key referencing the statistic
    private int value;

    public UserStatistics() {
        // Default constructor
    }

    public UserStatistics(String userId, String statisticId, int value) {
        this.userId = userId;
        this.statisticId = statisticId;
        this.value = value;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStatisticId() {
        return statisticId;
    }

    public void setStatisticId(String statisticId) {
        this.statisticId = statisticId;
    }

    public int getValue() {
        return value;
    }

    public void setValue(int value) {
        this.value = value;
    }
}
