package com.example.expbottleboost;

import org.bukkit.entity.ThrownExpBottle;
import org.bukkit.event.EventHandler;
import org.bukkit.event.EventPriority;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.ExpBottleEvent;
import org.bukkit.plugin.java.JavaPlugin;

public class ExpBottleBoost extends JavaPlugin implements Listener {

    private int minExp;
    private int maxExp;

    @Override
    public void onEnable() {
        saveDefaultConfig();
        loadConfig();
        getServer().getPluginManager().registerEvents(this, this);
        getLogger().info("ExpBottleBoost enabled! XP range: " + minExp + "-" + maxExp);
    }

    private void loadConfig() {
        reloadConfig();
        minExp = getConfig().getInt("min-exp", 50);
        maxExp = getConfig().getInt("max-exp", 100);
    }

    @EventHandler(priority = EventPriority.HIGHEST)
    public void onExpBottle(ExpBottleEvent event) {
        int newExp;
        if (minExp >= maxExp) {
            newExp = minExp;
        } else {
            newExp = minExp + (int)(Math.random() * (maxExp - minExp + 1));
        }
        event.setExperience(newExp);
    }

    @Override
    public void onDisable() {
        getLogger().info("ExpBottleBoost disabled.");
    }
}
