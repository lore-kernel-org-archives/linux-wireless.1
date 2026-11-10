Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331231;
	b=Fs7oNrXh6xQScWqN6GB12PoTVTcaPRdOOunNL/mxpO8Dvb0WeH9ScJUvBs4REgJksAG6
	 QZ5WK4y/6NBcB2fAChDGCZ49EMV2iZshfCiUgAaNcAE5WntRQyMcKPhUMTPRej2a4wdIQ
	 0a3chpJ8EdXdif1Qp2ncPvQFinkL1K1s35OQfqikKmnUMG+0ff1LofGJLVoSVovyNOlf4
	 3qa/TR0Og/0RB4rSA+8bN3VIWgzJMMs/Qv7oYiT92mxI2EvMbh3McyX/IC75LWblIj9cT
	 2boXed8Df1OYgG05kleZGUYGJscef0cRy05n2iXtiL8KAfl5SUaEu4LjHaqx1TCBBiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=uBV58YhPDOaC3nU5moWQwXL3FPvHNqE225/vb5rTGtE=;
	b=NPFNUlml5w0u4UPlm6Wgwp36/8H7Tv5zR7rKw1fbsvKRQRbKjrZ6hFwLC3/B2lVuQgyd
	 mSlzkTfyxiRBXiMzEmWqfu7ED1sKfx2fC73CnPUGjpxHNYfbCPTAHGG0/o0t0vj/JUowN
	 bpatIi50V5Q3jdLlMT0oTU3NlSoAv7fzH2yykU0sBPcSOCtVGjx4Srp0KhO8jLUYXVOly
	 H/yW9ndhMOY6dt4RhOkqbhAORIbGD93WoMOTlE2aNS1nZ3fHL24kkkfDI7g/pI7GFpnfT
	 0IKDzTrslstLDAl2CUZftCmXBE3rHUZqfR7hEr7ORPdguqAJobtF4YImOiqfIsQGf7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fq4RDCNR;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1180606A32E
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 17:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1180606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fq4RDCNR
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-498f5fa5103so433847f8f.2
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331229; x=1794936029; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBV58YhPDOaC3nU5moWQwXL3FPvHNqE225/vb5rTGtE=;
        b=fq4RDCNRm/e6DSM4AE0Sheb5en493vzQxP1ZfjnRmZAnrOZx3up+liWrHxHbnpA1Cs
         SQqXyT2i4nuEdrl8OBq6hEpNOuKbGXIAtvjfFeg8k+FIXLbYJXkvvRRQXlpYFvGByaQt
         M5kTCL6ZTUIUwn6brZUTYS7NsME1VSO341ncTSO6Y3k3AR+9E2OjBtsQmregFNwP5mBT
         FbAWagCfjSkpQajtN9OdIRVvdmcyq+pPg5yDO4m719qElFC5DLrpcqAXvnIjTm99RqFL
         9WsCDAE1YtITpabD50EXUBuN9ZYeGhw+y1mIz7SuNY+tErOlWvY9GIf+k8HZGqiIOSfC
         5Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331229; x=1794936029;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBV58YhPDOaC3nU5moWQwXL3FPvHNqE225/vb5rTGtE=;
        b=Aes4/fAbWfoSGTGAoUq34cWNxmBleWl4MSZaVVJWbIUq9u0A4rWa3a4rhLJnP3arge
         XYxTsI3+pBpnJhtWLi/6lVc3B/k5vBoFP54NhaIUNSjk/+R46/KB+b6HhrUrsy1TSSbv
         MwLG7eU9WOrPg3ctUmZZ4D6ZPaMbsayOeis29IkFvVWzEN/HVsSVqGry7utpumnZKOeq
         KJDN0Vnsvj6YoRhUul5ihM5JeTQZmVOij3pueidbHJSSjjMJhFh0n7+zqkPxA8lY++SE
         OEopooWT4bWplORxu0acwz4TdyXHapQFA6Qa+Jx1ldcL6/2azkArVRIP198WcbWBvDXE
         Ov3A==
X-Forwarded-Encrypted: i=1; AL+hErE3X0eD0I/lVkPDqcfDSbvFahwiMB9onYI92VCP7cJm8QI7Cpplaa7WpGtgFtIy4i7DN/vu2cAypstVcJ6Vvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/GOLKs7cjZaZnLOC4HbFwuQyNXagTwdojZWZXvLvnLjOyQjws0
	EVWMfKS2FgJGU0t5mFKu1nxcr7b21rUbB2YanGW/6y0HLy3RpJ0gUHRB
X-Gm-Gg: AYBFou0pRvHolmrPSvJPg8NeW3Gm6473+SPXt90Z2A1F1uYogLJvgEk0nJz2Ek4pSY5
	olR2pdwj/4KpMxnF2Cy2UMteO7hd39w+XJH3FwXWpOV4XnBh8EvM57u1/cLdAXUMTuIxeIzAGzM
	xvL/EuIAImYc/ruQbXpFsW7NQSjubb5eCdUInzjnHAMUCVEy0BwHUHaMwSxQ6830n84spvl/2cH
	s6pj4qnKg6PhaIHIwc+T7hbiZLigkTs00Lvhi/1s4irqQAnEeKPB53/MO6SjbBf2SnAAQER/fjo
	S0XxXBGdMGEGSzdBrLKapsBnydl6nlCxxeuQuIqQxJYpUxcH0XkRPgcxSTw+Xjir0HKSlC0/IfY
	e78HCAHE6yFrb5LUfSiS6sG/ZVLHRoW4KuNq9WCjJPJPB9vn2tOJicf2Vkxvc05ZPxPgWRJtU0S
	+Sduljau76CcHcuTC99yfMN6bWIsuzGBeQcuZ8rubzG1IGiEfI+mZ4Q66uStNuuQ8dW53q10Juj
	4i7aZJgS/tbOuWWOkCwfGo60bSdNLb9gZUWZxgWNrdArQbjsgOkSTGAJU1lzp+rCAauSY/RY+hd
	pN/R4a5WqFMUVBQA9nx84XlS5udKwaukl7kMnSilFhg+Dox18dZb0ADqKQ0M6vD04wNYl9/flGj
	cRfNjviNgNkf9+0y4aBFvZf9vXZle/J3kfvEmA+X76KTees0=
X-Received: by 2002:a05:600c:c0c2:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4ba02bd1ae9mr41720335e9.26.1794331228675;
        Tue, 10 Nov 2026 09:20:28 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm77853145e9.2.2026.11.10.09.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:20:28 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 18:20:27 +0100
Message-Id: <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Filippo Falezza" <effeffe99@gmail.com>
Cc: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Jeff Johnson"
 <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>

On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
>
>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>
> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> lm-sensors, hang for 5 s on every run, and configuration changes of the
> interface wait for conf_mutex in the meantime.
>
> Whether the firmware answers cannot be told from the chip: firmware that
> answers and firmware that does not both advertise
> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> Instead, remember that the running firmware did not answer, and return
> -EOPNOTSUPP right away on later reads. Forget it when the firmware
> starts, so that a restarted or updated firmware is asked again.
>
> The first read after each firmware start still takes 5 s when the
> firmware does not answer. Reads on firmware that answers are unchanged.
>
[...]

Hello,

I've just now seen this and it will break some setups. It seems that some a=
th10k
devices that usually respond to the thermal WMI messages sometimes do not.
This is from a QCA9888 that does not have your patch yet:

[431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
[433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
[434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
[435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read

Like you I have a daemon that reads the sensor periodically and it seldom
fails to read the sensor value for whatever reason. Most of the time it wor=
ks.
With your patch once I've hit this, I will never have a valid reading anymo=
re.

So how about I post a new patch that only fully disable sending when we hav=
e
like 3 consecutive read fails, and in the mean time I can also lower
ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too lo=
ng ?

Jeff / Loic is that ok or do you have any other suggestion ?

Thanks
