package config

import (
	"log"
	"os"
	"github.com/joho/godotenv"
)

type Config struct{
	DronePort string
	DispatcherPort string
}

func Load() *Config{
	if err := godotenv.Load(); err != nil{
		log.Fatal("Drone env file was not abled to be load")
	}
	return &Config{
		DronePort: getValOrDefault("DRONE_PORT", "8080"),
		DispatcherPort: getMustExist("DISPATCHER_PORT"),

	}
}


func getMustExist(key string) string{
	val := os.Getenv(key)
	if val == ""{
		log.Fatalf("The env variable %s doesnt exist", key)
	}
	return val
}

func getValOrDefault(key string, defaultV string) string{
	val := os.Getenv(key)
	if val == ""{
		log.Printf("The variable %s is not present, so the default was used", key)
		return defaultV
	}
	return val
}
