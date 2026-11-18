Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017381;
	b=kxw70NOXiWh3qwSsDUw7bIfNwqj2mkcnopfj4htj34U8gpjgV3aKsBiQa3enyfR9SLtX
	 oVMBbhXVpWHW033YcRjEVzJTZmQfP/+wgAzfyCzTs5o7na8nfLBKqedPvrx/9IgrBEfdO
	 yVp+O4PnQSg7imuY5vAUl8P94K++nCGrMWHMKT14zmVyRbIBO0Frae6G8JAyDSadlruOY
	 2cHYj1XzKWJQ/C6D/aJCPfCj06fC+bS20p0iOBci4avufk3bZBurvT5rUJ88U9fClEkzO
	 E26Lg+EinYKt+NWcsjc/KlXCNgvTvpJwyE3L72Udu0Alk+hU/1Tc8/dtpGzBdfcPJKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=14Rrkj1zzHeLghewisueOdMH2DyN75ASzqaxxjdbHII=;
	b=lMKRFu/uUPzCAJVKZcSvTV3F4l9K6zhPA7fzW4DyWTicy9CI9AgRxv8gQ+/M+rUTFaku
	 G3DCbzKOZw23Mm8UibdGULZ6beQagXQf+kP0y0BltgDWCRc17jlYo//3j1wwgcIWB9W2t
	 uZGeF8wOXT8EdYKVqd05Nd9JA1+05z4px9p3yeJ1sRhw5qS5RCH53+w476ok+KUbAboEE
	 HGE00SUp0DSRKTO0G1mGmcYcsf7vddhuvpmzlfYbsz/52RAP0NxjqfvfyyVZKERvJ85iK
	 /p+Jm8JYgkM29y382pXTc5lB0ukJVzT/2JNCD5OqzDC5f1nX5mFtrcjuRKFrrYF/cjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNpXJrNj;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDE560A2602
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 15:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFDE560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNpXJrNj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-497614c95f0so700837f8f.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795017379; x=1795622179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=14Rrkj1zzHeLghewisueOdMH2DyN75ASzqaxxjdbHII=;
        b=nNpXJrNjgKX0g/k/8W9uTi0ybiMY9Om5fZndrOSFdhShxcIomGz3aBxaUmAZCrIq+5
         VgD0UrFWXEsxqzNgG6Lpt3XJoiRPno05Gm8vpL+P06cGHajtkW+xtd3DBzNacE+KRmbc
         iscxt+USh5F6yVuVukaxhsHos3Sb/DexpU8XtmIdBHGk1BhwQDVv9yKSO0Kt8RZlMqPO
         uTivgyS5PepaJkovS9dOvTZ5qWz9VVDq2Y7BJ8jPJ0oNrJsBCl5OMHT3aK54As4ntA+P
         QQMK4yvMVFFZAEkG3xmK5TljtSnT82f4DFeNhF3r8VnJg7eMCHStokTQLS8yZfO6Ivmr
         3aYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017379; x=1795622179;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14Rrkj1zzHeLghewisueOdMH2DyN75ASzqaxxjdbHII=;
        b=dV9GKoDMZBEVSEvOy03x54NgCYconS87KkCl9Ws6XfpIkF8GSaG0zxOZee3+EzluJ+
         o74WSjzYE9gV1tIJr/Dynle/BAOyY50faqVTxKWrJtKG6cf2IO0m/uPkyIsPTX6PsCB6
         Cg8pnbNXft+GWgzlM5wZ6XT8Bq0jiIwl47IV6G8272GqgZTH0cTtpyMFRVu7hUHxet2K
         q+ipFbyl/h8fz8kih/tUnfBj0+Wu27pJNygnRPulq8s+QSAunJqnxUZzRxYxrwyx86V8
         2ShCh1Vgcu+2Oug77NlQcSbuwV2er+X/UqOyuFC9RoWJe2nac0fkb/OJ71ndndIoAm4l
         MOtw==
X-Forwarded-Encrypted: i=1; AL+hErEmmxEFXlWjoXzP69XP0X4b/AUBq8iKSeeryzjo77133wEa+ScpIC1weLa4mX3vNpFNPp9RGykrDr4CtyiKLA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/plHpAV7KEi6JN8hpCbU8RBIgUmo2kJfnObS3m+ScfOwRoWpjg
	kjL3MtYUaAaKug8AdV6R4RCoL259jS9lGWmVgQZxYTxSmVERKTb7mZ2s
X-Gm-Gg: AZFdTZeXgMSHeycsVgbcX+VUwzwgT+jNlKYNaa5bQMxc8QI4uEt9GiSkix6GliY8+J4
	lA9pS07EUOGw3moEMSPpUPw3UGoOGatth4y7Ayo9AhZz0+pQUZ2DA6EL3dhRBIFRZukO08NrXj4
	7rHBczZ0t9DHlBsPCmW4tEhe+XnEpMyQloNUAdg66eygWU7qYFyHz5hHV8BMLvbpo7QaIpk9T2o
	d8vziC+DVVxPbqaYGBsaEb5HoCJobA0Qsuh60w9V1VcgITFyJJyl7HBJbKrzjK/Tw8MLo10g48/
	haj/UTKxZLNvaZyvxoCAWTnhjAKuF1ccP6p/DgFRX3dOnM6umzAtYUFpBdL7RfwoLjiIP/HdHwM
	f7QyqcM4WZSb+ZX3tvBUsvFTb3Q94M9Luav3kBt68uorhhTUZYgD2RsREWcAtOoeuYO2j1fJC6w
	kiwxMWRL2pRy9EhW+DE/p4MMl43OOcHzf9bXXTM2oLk/wqoMeJgQv2K3h51qmZ9MGGk38UcVAKw
	ixGFzdAVhzTloh5GoVgW7a1eWJ7RgeFtE/Fa7GD0kKWded9a4+C+61eyXlWbKgIiX44pkkXKntb
	FJYU6WKWLANGNpYfPivuN6nJSG3hZIO25IyZcoY=
X-Received: by 2002:a05:6000:461a:b0:493:fdf6:14aa with SMTP id ffacd0b85a97d-4a63c657ca2mr7054638f8f.56.1795017379082;
        Wed, 18 Nov 2026 07:56:19 -0800 (PST)
Received: from [192.168.1.50] ([188.27.124.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656c11f4bsm5644289f8f.51.2026.11.18.07.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 07:56:18 -0800 (PST)
Message-ID: <eac5da81-b823-4f9e-ac85-add330c03b0b@gmail.com>
Date: Wed, 18 Nov 2026 17:56:15 +0200
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
Subject: Re: [PATCH rtw-next 5/5] wifi: rtw88: sdio: read neighbouring
 registers of the 88xx chips at once
To: =?UTF-8?Q?David_H=C3=A4rdeman?= <david@hardeman.nu>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
 Alastair D'Silva <alastair@d-silva.org>, Luka Gejak <luka.gejak@linux.dev>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
 <20261116190145.2736364-6-david@hardeman.nu>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261116190145.2736364-6-david@hardeman.nu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/11/2026 21:01, David Härdeman wrote:
> Every register access costs a full SDIO command, about 40 us on a NanoPi
> R76S (RTL8822CS, SDR104), no matter how many bytes it moves. The
> interrupt handler reads HISR and then RX0_REQ_LEN, which follows it, and
> a free page sync reads the three REG_SDIO_FREE_TXPG words one by one.
> 
> Read HISR together with RX0_REQ_LEN, and the three free page words, with
> one transfer each, as Realtek's driver does. As in rtw_sdio_readl(),
> this is only done while the chip is powered on; before that, and if the
> small DMA-safe buffers this needs could not be allocated, the registers
> are read one by one as before.
> 
> On the R76S acting as an AP, TCP throughput to a client goes from about
> 170 to about 190 Mbit/s, the other directions are unchanged.
> 
> Signed-off-by: David Härdeman <david@hardeman.nu>
> ---
>  drivers/net/wireless/realtek/rtw88/sdio.c | 84 ++++++++++++++++++++---
>  drivers/net/wireless/realtek/rtw88/sdio.h |  4 ++
>  2 files changed, 78 insertions(+), 10 deletions(-)
> 

[...]

> diff --git a/drivers/net/wireless/realtek/rtw88/sdio.h b/drivers/net/wireless/realtek/rtw88/sdio.h
> index ab366f82d92..6aa59ed3db2 100644
> --- a/drivers/net/wireless/realtek/rtw88/sdio.h
> +++ b/drivers/net/wireless/realtek/rtw88/sdio.h
> @@ -188,6 +188,10 @@ struct rtw_sdio {
>  	bool free_txpg_valid;
>  	/* TX aggregation buffer of the non-8051 chips, under tx_credit_lock */
>  	u8 *tx_agg_buf;
> +	/* non-8051 chips: HISR + RX0_REQ_LEN, read by the interrupt handler */
> +	__le32 *rx_regs;
> +	/* non-8051 chips: the REG_SDIO_FREE_TXPG words, under tx_credit_lock */
> +	__le32 *txpg_regs;
>  	/* one writer at a time between the credit check and the accounting */
>  	struct mutex tx_credit_lock;
>  };

By the way, you can call them "3081 chips".
