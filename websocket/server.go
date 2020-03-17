package main

import (
	"log"
	"net/http"
	"fmt"
	"time"

	"github.com/gorilla/websocket"
)


var upgrader = websocket.Upgrader{}


func main() {
	http.HandleFunc("/", echo)
	fmt.Println("listening ...")
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func echo(w http.ResponseWriter, r *http.Request) {
	fmt.Println("client connected")
	c, err := upgrader.Upgrade(w, r, nil)
	if err != nil {
		log.Print("upgrade:", err)
		return
	}
	defer c.Close()

	go func() {
		for i := 0; i < 10; i++ {
			c.WriteMessage(websocket.TextMessage, []byte(fmt.Sprintf("Hello from go server [%d]", i)))
			time.Sleep(500 * time.Millisecond)
		}
	}()

	for {
		_, message, err := c.ReadMessage()
		if err != nil {
			fmt.Println("read:", err)
			break
		}
		fmt.Printf("recv: %s\n", message)
	}
}
