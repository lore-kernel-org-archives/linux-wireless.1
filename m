Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.39.219.105
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794693007;
	b=kFupF318kWXbGq4gO4KcwzvyOkxi4wMTq8q8MGcmWgWJFtIZkNK6NBiFgJQwn5jq0FiS
	 uBCjrgO95obREtJqc1hUQ2HuqIpfKGf+/ro592oNTRiA/k8mGZHeCR8iex7nqdMCbUdwS
	 5VIswEBFU0GhQFQtvbCy+2IkToHj//BA56iHgJvqKHws/YizpKj22HEZKia+c2FunC7q7
	 VmF9xSXImiNSuRd9PCoEoKrVeJLPg+hxO8SwR5bBTFZ3ZZPqaCg04oua/EB3q2doyALzM
	 yAEBThshhZdqBtorlcuBLeSLTQGoPWIdnMapC3hQYqVnOttUluqCixFR3OKklFOMGPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794693007;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=zwgXA5+Odaroih+5cJP2flyJbkb2qJWJMVZacUW8A/g=;
	b=3/VXup6V2IjjA+2on6b5R3lQeXyGBJMrvR/3yb9PAONSTfTi9R/CZmctN/cPs8GLnP5g
	 1tAjJ1BrfBGgY3O8dY9F+EhC8tpTZjsxvuXr9/NnOm+pgfeai66zrgYZD5GM+gEWmVkUy
	 /MgW5vQytGBoRoste9XbekfGwRSQOLfHT2rJBOiLfs713MprOziaebj73XlkXkTerp9hd
	 O73x1aEnUKIuo80c5PK/79miGC4ljtztozQCHgLy3zdch+D6XoyQ4f8iHAO0aA9QN8p6p
	 iTXEWhCsAbdg25BLZdmBwtBFD4uhXICMdNmt/7zm7txNj6l/BOtZRrNHj3IzX6aqqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kaechele.ca;
	spf=pass smtp.mailfrom=kaechele.ca;
	dkim=pass header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256 header.s=201907 header.b=JsY6Bp7o;
	arc=none smtp.remote-ip=54.39.219.105
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6170606A327
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 21:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6170606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256 header.s=201907 header.b=JsY6Bp7o
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29AA7358BD1;
	Sat, 14 Nov 2026 16:49:54 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1794692997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zwgXA5+Odaroih+5cJP2flyJbkb2qJWJMVZacUW8A/g=;
	b=JsY6Bp7oYkBIAUjF6FRPGqhMc57BQBkz1cszaWMIUuyRacdBuW524t7Hffov1kKRucfhS6
	br1PG8VvunnbrFykCEorMvBy7QB4Y8y0dl+LrxddlHyOu7j07a0XsZLWkXiHNKjxYP0nko
	fgAipkwbUpyUwN/nveSnKyPsx1Rw/Zw=
Message-ID: <7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
Date: Sat, 14 Nov 2026 16:49:52 -0500
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/6] wifi: ath10k: usb: fix group key
 installation
To: Tomas Paukrt <tomaspaukrt@email.cz>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 David Heidelberg <david@ixit.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
 <20261114090737.64348-2-tomaspaukrt@email.cz>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <20261114090737.64348-2-tomaspaukrt@email.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi there,

looks like another take on David's patch here: 
https://lore.kernel.org/ath10k/20260918-ath10k-del-v1-1-53cd7a7d682b@ixit.cz/

Given that this affects a few devices (not just the USB one mentioned 
here) a more generic fix would probably be in order. I'm also seeing 
this on QCA9379 SDIO.

Regards,
Felix

On 2026-11-14 04:07, Tomas Paukrt wrote:
> ath10k_install_key() waits for install_key_done, which is completed by
> the HTT security indication. The firmware of QCA9377 USB devices sends
> this indication for pairwise keys only, so the installation of a group
> key times out after 3 seconds and a station cannot connect to a
> protected network:
> 
>    usb 1-1.1: failed to install key for vdev 0 peer c4:93:00:3b:6c:f9: -110
>    wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to hardware (-110)
> 
> The firmware does send WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID for every
> key, so complete the key installation on this event for USB devices.
> The other buses are not changed.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
> ---
>   drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index e57588c19c80..7d43a23017aa 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5339,6 +5339,10 @@ void ath10k_wmi_event_vdev_install_key_complete(struct ath10k *ar,
>   						struct sk_buff *skb)
>   {
>   	ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID\n");
> +
> +	/* the USB firmware sends no HTT security indication for group keys */
> +	if (ar->hif.bus == ATH10K_BUS_USB)
> +		complete(&ar->install_key_done);
>   }
>   
>   void ath10k_wmi_event_inst_rssi_stats(struct ath10k *ar, struct sk_buff *skb)

