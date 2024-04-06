package com.example.profileservice.model;

public class Statistics {
    private String statisticId;
    private String name;
    private String description;

    public Statistics() {
        // Default constructor
    }

    public Statistics(String statisticId, String name, String description) {
        this.statisticId = statisticId;
        this.name = name;
        this.description = description;
    }

    public String getStatisticId() {
        return statisticId;
    }

    public void setStatisticId(String statisticId) {
        this.statisticId = statisticId;
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
