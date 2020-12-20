// RUB/USD exchange rate from the The Central Bank of Russian Federation.

package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

type Data struct {
	Valute Valute `json:"Valute"`
}

type Valute struct {
	USD USD `json:"USD"`
}

type USD struct {
	Value float32 `json:"Value"`
}

func main() {
	url := "https://www.cbr-xml-daily.ru/daily_json.js"
	spaceClient := http.Client{Timeout: time.Second * 3}

	req, err := http.NewRequest(http.MethodGet, url, nil)
	if err != nil {
		log.Fatal(err)
	}

	req.Header.Set("User-Agent", "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36")

	res, err := spaceClient.Do(req)
	if err != nil {
		log.Fatal(err)
	}

	if res.Body != nil {
		defer res.Body.Close()
	}

	body, err := ioutil.ReadAll(res.Body)
	if err != nil {
		log.Fatal(err)
	}

	data := &Data{Valute: Valute{}}

	err = json.Unmarshal(body, data)
	if err != nil {
		log.Fatal(err)
	}

	usd, err := json.Marshal(data.Valute.USD.Value)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Println("💲", string(usd[:5]))
}
