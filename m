Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152147;
	b=PQeI7u2IqxrO16CzSuAMjNVUHjifGT/1e319oKxlWFXdkeGJUN1RJJDH16Zr77I6svtS
	 7IU7G3xayTx2s3JIv4lPG4ASm9PPnO8bMYMqZDqauHbLeOvZ3qnLWHlongu8GxQ79ioQk
	 u8gL1xDnWYTyti8NrvVGeMgzmJ9uJeVknO4fKk0B6s4A6U9kOXvymv+5Sz67gCZf1Mn1k
	 cXqJUkZ7+kancKveLZwORS8Oa79WRm5SWBkDxTk7pttzBi+uCICmcYdv9BkHUZ1JyGTGG
	 U0z22ayPttGgdnBKmj4nbAMFvwpQzPOf7/5mUTfgqu8JRLpb4F7Y7k9N0Tgj8JCZgbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ScUor+4iUajPQaIqXe4lQauT9eIuSXlVdhqPdv/U/Kk=;
	b=AmBKfQLmiLJkkzCSV85INIIV2CZBbSIunCjmpvWBqt4F9qtj6Nu8xmYh/KC544n8GGJr
	 fKdosp9EKKOmqFv/ErGjnJ8YJ3YkmKYVhVOFrs15EHVf0fKeRC+l8WJlRchSaHQGLHVJp
	 2KKXCNZ052XkHRCHOoxaeN4h984IuIBBqpvSCoV+g+jojxUSb4FAafl2AeaoRUG8Ffyzq
	 3LC/zoxW8BKjIUMCURY3MrNQRf/UZUZwiTwmR3Klpzqulslu6lsXbAf28QKot+UnuYKpG
	 Ls3N0C5YLjKEQts8otBvZrlxXr9DLNxPrSerC7p3hg1+QBP1tVDdSdOO8xdyhcjD2/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLAIJO5x;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C54606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 15:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLAIJO5x
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1109835e9.2
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 07:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794152145; x=1794756945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScUor+4iUajPQaIqXe4lQauT9eIuSXlVdhqPdv/U/Kk=;
        b=qLAIJO5xk88eaO5CgTP4oeofIlMYaRT7LULGQdo7ei4lZtwctMN4DqKqOgLZGj9lxv
         /WQU2lQfMJ74ekNrLgJ+iz/gI2gveAj63j8c1JXf7QOoM1jRQN9FbRslTQJ+v74dViMc
         yIWSS6HgFB2zeCboOi3UQVlqVhLoAwdR1GN6fot4kIj7khPD26s9gcTHW5uiU9XUTIcs
         rimW5libN1VV/r8AyyIVUEgkXfIR7tsLfKTJnf+U9JuGSZ6X92ylqaITqxfGzBDK31nu
         tiZils768p47aOXq7nBBAxoMJykU037vKE2j0LRnc5qGAW/rjr66WHNmv6n2k6yxtxZx
         dn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794152145; x=1794756945;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScUor+4iUajPQaIqXe4lQauT9eIuSXlVdhqPdv/U/Kk=;
        b=aj1QXojG6ax+BiOlRbDMvnGVysfvyHQreP0d5ure5hKEQJZRx+XNOklTrPhICBFcZs
         4jGCi0qynF9xXnVf3z7I4Z6KUJYbBgx90Bo94ZLrXX7+/oZEWhzhtG2ENP78KfXKKaL6
         x3Aj4bDgG7nGbpXZ6vGOTaPAC//9qaJTXcCAKmi6TiMQXEN2Ppv3SffRtOyG4I30tXE2
         ea2zop74I5KMjRr2ZqfhItpphThA9JjPWWtk/HSBHRxLxTx/4MYyIKkEMZp7Hx5hu49D
         oRSJF6wtpzw8D6I1TwalkyU32eXhPuiJsML3lowJ9gI41Zavuyj19cM1aicIuuEyBlaf
         Wyiw==
X-Gm-Message-State: APuU4Z/xLuGnXyleD6y9KbCgrtaLvzVDZIrf5vEkZPqP4dirijNvf4sV
	C3F6WWJa95KK/NwJMi7a2cjDiFZ2M7jNTC7mHTmYhivqKHzc5G9sGrPJ
X-Gm-Gg: AYBFou15RBQ8mABgC4YPTgED1gAoOVbA+m+nxe7Tt0bL5qjRd/co0CCYxzR30Op02DI
	6ZkNF8xV7XuecYKNegMR7LpHcHOm5SxuaTkt8hXKcE8vT6l02tIUA010m6pPQZYQ6zFliutIZJC
	auiaQeTXd3dI/P7s6+Nb0ZuGOmsOgcUPpMV3DjWJhkRy7AEVUKTfepz8m1UDt6Zcq9c45j1YyNs
	L1dJ/jer8NNTIey8FY5fedbmrmJluDNQPHprcR+689ESLo56rKZepoq2rI1x6eid71HWYTvMhhF
	EfkcgrFM+EtYNUZbNm7En7mP6ZTyqnMpzG86YEgBFVL8ovaeErPoeg318mOM6QNuQUUu4p/fj+s
	RdMHYlrebzUUKrgSw/4hagtzNxKDKcF8MGHc4N7HGp4F6zpqFEk4I1ViWMOT/oP1bZEoW+wI2/g
	TtDIV2g6XdI47fLl3l5dmHvBDNnuZaYPylCmazoPaFGJpRcKqH1Wk5k2/jGvmtQPZq1HOqybTkq
	hkJHgokdLmq59jQjYeZ09RDTeX+NBCqEB/Lgf/sKHPMVSkQ9Qb+wV/+csGRAzkpFPFxLI683+eY
	2fYz8vG5zsU03NRD463l08XWOMBl7Jt6eC19
X-Received: by 2002:a05:600c:34c9:b0:4a1:fa33:441a with SMTP id 5b1f17b1804b1-4b94d7631ccmr33272835e9.2.1794152144779;
        Sun, 08 Nov 2026 07:35:44 -0800 (PST)
Received: from [192.168.1.50] ([81.196.40.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597934c2bsm4789478f8f.49.2026.11.08.07.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 07:35:44 -0800 (PST)
Message-ID: <72fc9599-3f63-4da9-bc18-aeb09d0f757f@gmail.com>
Date: Sun, 8 Nov 2026 17:35:42 +0200
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
Subject: Re: [PATCH rtw-next] wifi: rtl8xxxu: Allocate the USB control buffer
 separately
To: lnwgorou@gmail.com, Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>
References: <20261108-b4-rtl8xxxu-usb-buf-v1-1-ed021a85a2b9@gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261108-b4-rtl8xxxu-usb-buf-v1-1-ed021a85a2b9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2026 11:42, Tapparit Rukthawornwong via B4 Relay wrote:
> From: Tapparit Rukthawornwong <lnwgorou@gmail.com>
> 
> priv->usb_buf receives the data of every control-IN transfer used for
> register reads, but it is embedded in struct rtl8xxxu_priv directly
> after usb_buf_mutex. On CPUs with DMA-incoherent caches the two share a
> cache line, which Documentation/core-api/dma-api-howto.rst says can
> corrupt data.
> 
> This happens in practice. When another task contends for usb_buf_mutex
> while a read is in flight, the CPU writes to that cache line, and the
> device's data can be lost when the buffer is unmapped. usb_control_msg()
> still returns the full length, but the read returns stale buffer
> contents, typically the value of the previous register write. The driver
> then writes that value back in a read-modify-write.
> 
> On an RTL8192EU, a stale read of REG_FPGA0_XA_HSSI_PARM2 (0x824) during a
> scan is written back, after which the chip stops receiving and does not
> recover on its own. REG_FPGA0_POWER_SAVE (0x818) also drifts away from
> its init value without obvious symptoms.
> 
> Aligning the field inside the struct is not enough: the struct lives in
> the mac80211 private area, which is only NETDEV_ALIGN (32 byte) aligned.
> devm_kzalloc() returns ARCH_DMA_MINALIGN aligned memory, so allocate the
> buffer separately.
> 
> Tested on a Raspberry Pi 2 (BCM2836, dwc_otg, 32-bit, 6.18.50 with this
> change backported) with a TP-Link TL-WN823N v2 (RTL8192EU), triggering a
> scan every 15 seconds:
> 
>   unpatched:  599 scans, 9 receive hangs with 0x824 corrupted, plus
>               2 other connection failures with 0x824 intact
>   patched:   1200 scans, no failures, 0x818 and 0x824 correct at
>               every check
> 
> To look at the reads directly, a test build put a sentinel in the buffer
> before each read and re-read when it came back unchanged. 300 scans per
> layout:
> 
>   buffer next to the mutex (current):  72 of 193 contended reads stale,
>                                        0 of ~260000 uncontended reads
>   buffer in its own cache line:        0 of 214 contended reads stale
>   buffer from devm_kzalloc():          0 of 270 contended reads stale
> 
> The re-read always returned the expected value, so the device answered
> correctly and only the host-side buffer was stale.
> 
> Signed-off-by: Tapparit Rukthawornwong <lnwgorou@gmail.com>

A similar patch was applied just five days ago.

> ---
> priv->int_buf has the same layout (embedded, next to CPU-written
> fields) and is used by chips that set usb_interrupts. The RTL8192EU
> does not use it, so I could not test a change there and left it alone.
> ---
>  drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h   |  2 +-
>  .../net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c  | 30 +++++++++++++---------
>  2 files changed, 19 insertions(+), 13 deletions(-)
> 

You are working with the wrong tree. rtl8xxxu_core.c was renamed to
core.c a long time ago.

> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
> index fd92d23..de5d9a7 100644
> --- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
> +++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
> @@ -1875,7 +1875,7 @@ struct rtl8xxxu_priv {
>  		__le32 val32;
>  		__le16 val16;
>  		u8 val8;
> -	} usb_buf;
> +	} *usb_buf;
>  	union {
>  		u8 raw[EFUSE_MAP_LEN];
>  		struct rtl8723au_efuse efuse8723;
> diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> index efddbe4..9af0b0c 100644
> --- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> +++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c
> @@ -663,9 +663,9 @@ u8 rtl8xxxu_read8(struct rtl8xxxu_priv *priv, u16 addr)
>  	mutex_lock(&priv->usb_buf_mutex);
>  	len = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  			      REALTEK_USB_CMD_REQ, REALTEK_USB_READ,
> -			      addr, 0, &priv->usb_buf.val8, sizeof(u8),
> +			      addr, 0, &priv->usb_buf->val8, sizeof(u8),
>  			      RTW_USB_CONTROL_MSG_TIMEOUT);
> -	data = priv->usb_buf.val8;
> +	data = priv->usb_buf->val8;
>  	mutex_unlock(&priv->usb_buf_mutex);
>  
>  	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_REG_READ)
> @@ -686,9 +686,9 @@ u16 rtl8xxxu_read16(struct rtl8xxxu_priv *priv, u16 addr)
>  	mutex_lock(&priv->usb_buf_mutex);
>  	len = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  			      REALTEK_USB_CMD_REQ, REALTEK_USB_READ,
> -			      addr, 0, &priv->usb_buf.val16, sizeof(u16),
> +			      addr, 0, &priv->usb_buf->val16, sizeof(u16),
>  			      RTW_USB_CONTROL_MSG_TIMEOUT);
> -	data = le16_to_cpu(priv->usb_buf.val16);
> +	data = le16_to_cpu(priv->usb_buf->val16);
>  	mutex_unlock(&priv->usb_buf_mutex);
>  
>  	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_REG_READ)
> @@ -709,9 +709,9 @@ u32 rtl8xxxu_read32(struct rtl8xxxu_priv *priv, u16 addr)
>  	mutex_lock(&priv->usb_buf_mutex);
>  	len = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  			      REALTEK_USB_CMD_REQ, REALTEK_USB_READ,
> -			      addr, 0, &priv->usb_buf.val32, sizeof(u32),
> +			      addr, 0, &priv->usb_buf->val32, sizeof(u32),
>  			      RTW_USB_CONTROL_MSG_TIMEOUT);
> -	data = le32_to_cpu(priv->usb_buf.val32);
> +	data = le32_to_cpu(priv->usb_buf->val32);
>  	mutex_unlock(&priv->usb_buf_mutex);
>  
>  	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_REG_READ)
> @@ -729,10 +729,10 @@ int rtl8xxxu_write8(struct rtl8xxxu_priv *priv, u16 addr, u8 val)
>  		addr |= 0x8000;
>  
>  	mutex_lock(&priv->usb_buf_mutex);
> -	priv->usb_buf.val8 = val;
> +	priv->usb_buf->val8 = val;
>  	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>  			      REALTEK_USB_CMD_REQ, REALTEK_USB_WRITE,
> -			      addr, 0, &priv->usb_buf.val8, sizeof(u8),
> +			      addr, 0, &priv->usb_buf->val8, sizeof(u8),
>  			      RTW_USB_CONTROL_MSG_TIMEOUT);
>  
>  	mutex_unlock(&priv->usb_buf_mutex);
> @@ -752,10 +752,10 @@ int rtl8xxxu_write16(struct rtl8xxxu_priv *priv, u16 addr, u16 val)
>  		addr |= 0x8000;
>  
>  	mutex_lock(&priv->usb_buf_mutex);
> -	priv->usb_buf.val16 = cpu_to_le16(val);
> +	priv->usb_buf->val16 = cpu_to_le16(val);
>  	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>  			      REALTEK_USB_CMD_REQ, REALTEK_USB_WRITE,
> -			      addr, 0, &priv->usb_buf.val16, sizeof(u16),
> +			      addr, 0, &priv->usb_buf->val16, sizeof(u16),
>  			      RTW_USB_CONTROL_MSG_TIMEOUT);
>  	mutex_unlock(&priv->usb_buf_mutex);
>  
> @@ -774,10 +774,10 @@ int rtl8xxxu_write32(struct rtl8xxxu_priv *priv, u16 addr, u32 val)
>  		addr |= 0x8000;
>  
>  	mutex_lock(&priv->usb_buf_mutex);
> -	priv->usb_buf.val32 = cpu_to_le32(val);
> +	priv->usb_buf->val32 = cpu_to_le32(val);
>  	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
>  			      REALTEK_USB_CMD_REQ, REALTEK_USB_WRITE,
> -			      addr, 0, &priv->usb_buf.val32, sizeof(u32),
> +			      addr, 0, &priv->usb_buf->val32, sizeof(u32),
>  			      RTW_USB_CONTROL_MSG_TIMEOUT);
>  	mutex_unlock(&priv->usb_buf_mutex);
>  
> @@ -7882,6 +7882,12 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
>  	priv->udev = udev;
>  	priv->fops = (struct rtl8xxxu_fileops *)id->driver_info;
>  	mutex_init(&priv->usb_buf_mutex);
> +	priv->usb_buf = devm_kzalloc(&interface->dev, sizeof(*priv->usb_buf),
> +				     GFP_KERNEL);
> +	if (!priv->usb_buf) {
> +		ret = -ENOMEM;
> +		goto err_put_dev;
> +	}
>  	mutex_init(&priv->syson_indirect_access_mutex);
>  	mutex_init(&priv->h2c_mutex);
>  	mutex_init(&priv->sta_mutex);
> 
> ---
> base-commit: 68254f26db2c9d6aad3ed9561306a42ac5cd12bd
> change-id: 20261108-b4-rtl8xxxu-usb-buf-eefe08cbbe71
> 
> Best regards,
> --  
> Tapparit Rukthawornwong <lnwgorou@gmail.com>

