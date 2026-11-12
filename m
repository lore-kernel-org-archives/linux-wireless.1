Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489555;
	b=ypC6SHRgMWpJucYWoVsEpJqZGb79bnybbgwxVQyNOU08mu6zYBM0ZMLtnrNBe9d+/kat
	 QjfBXERmww8hIBjLtMC+Yhp+PUXMWfQ7H4lQfJgsqbJDr2T2UtEwj6wreK+CPgebQOSCt
	 4B5ToqDenC4+fFmI3GU/ZmKafvpXVYW/ivVbA/MD6nAgigpZm5woCo+nck7hTGGom2W4a
	 QdkES/wJUqWS4ufNlR2JiKm/5qoeD4fdb7Fw15+uRWrt8VANGQo9E3c10gjuQcZgU5xNo
	 nJZNmbWpM72Vjy4ffZR8KXQdZ0wVOYXNpcoQ6dvOHe9oSZn8V7aJizqrJV6A1osVP0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
	b=Ji6vTZhQFXv7hxS+H2xJZ2JBjtlSEvdaC21THX4jOYwctqUXMRMhaQbZhu9gVJfY+uzs
	 NkZySLf0Gpjblw892Sry18xFp4YGB2RJjptyuAif7vyCthmOn/Mws3kV4HxWsB1GZcInW
	 PTouw0sGGVwJA1aSk7cHszDrUTLgjWZKv3yKncObM0Zi8eGBDbSxteqOmILdy2gxx0PuJ
	 om2FYPEoIHCB/1mG/G/OJn88/aVfn57BfFD5+yp+fOg4+7Mz4lqh9VM85uJifMMr/NMSs
	 5yYqTRjiI9lcqpTh53VNaD8CIIn+6qhKOw8b87FkwwCfsNMlaiOfcwho5FJdD0TtE9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lZ/otIYg";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C94606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C94606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lZ/otIYg
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4c9abc1824so600895166b.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489553; x=1795094353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=lZ/otIYgy8swYzUCNzfqXiyQGMS1Iq4ut93ebgQEOQ4zpt/EWBbolzUlT9Rv0HrHTC
         VqeM/mt31B2MFwC8NIbsu2wkVp3h3Vs5kJ7a947VCVrZFA/6LWaPKw+9vJUrfPpGmK50
         fztZzCQ5azFMSkUMsaiqxLC9ezJZMP9EjnLfyVCTMBCxPONxFfoCdD4KxKUv0hP5cLBb
         5rK59OOYRy/mw9SF97n3ITUDZ0YB/Q2ZBBefGGIYvkA3EbJCWslWO+U/jkkonVinVgX4
         EqwMPVjD4sz9xh5QGSVklVRYqnxkzPNgbZs6qq3whI+MefP+FZ+kry6CWYUKeXQlOhbN
         2WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489553; x=1795094353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=julUOSEjDiDgpHclwVpxKxva8WelCXDy++4zkBQahkM=;
        b=z6cVMz79Pfve+69o3LGnRloF67gBqRcQkq2wl3l5YoRQ+Cp95RAvxyeMwg10CNqHnd
         efk2BT1DhLPgU1Ba6bJWwxleG48B1JAIdHIWfL8H0cQ2Qycbg/NHoOTWtOycWY0psLXt
         +l3eR3jCz4nBe4PjcVdnYcc3caK4kWapue8oceixHC/1Q3v/l2cyS7FobczykPnJy4w+
         Meus2Y/LGl9IynpUmUQ+qt9ZbsFAAjDEXmVh4WSiRUmnbgO9/bFqBaLlXwggJwfOTVQr
         6j0ZLUoJsQDhO1Gx0WEngBRNQwE26S2mvjerqvv01H1WpZSYJtr3tpp2x0LKAzs4XSzG
         3fXA==
X-Forwarded-Encrypted: i=1; AL+hErHnbVYFu0GEOQ69T0lRrnWoNjwWvj88TgogrJFztQVy/nxUEy2qPJScaVId+GJYZFfqk+2SWOc7F52jRsSTZg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uylhMXxuD46ZFWxyDVogkKgCMUPbRFPjBBv56XlU6SqP7qetg
	bg+I6iSWGl3HmmC54tDz7TQ0A7OZIjncLay/yKLjqdBi6x1sT3uWZKkD
X-Gm-Gg: AYBFou31yo15g32cZ270V4KbigAidbirYyhXXws64/BmzGinlstaRHz7UmXUWPLrMkU
	DWLJQMDZHKqEWTe300kRhf7PnC/D5AF9M6aVIt0cKkmw/8/I5k9pYyOTc5S1oNOS2+AxqJdK1gR
	vWBkgQWX70/eEPRYR7ngykc44SK4c/SN5Y8DAC8fQSeb4pWGM8IL00hNsjgcVZRZ15yxN4UzCJd
	yCG9NthaqgwTmjLmCHE8pbyqp84o/Yn8N9cYMv9C+gZB/bGimIVlitZs7sJD5Y9TRljzPUX1qw6
	UyXgDm3qD4ERXXCHDqEJ3E1LdXzHBM2rt2LrpgWnsVAovG29wGOIBGl+zlTYZQdMlr4jYJ4nBot
	MYI4Iu0/AUIuguzfWAN7C2aUxEFxD1dWp+a2FDEWgWbfdm3rAVS56iTPeuA+ZfSFYIdFpVtj1XG
	nyoAh9AhqcUwMc/xDqg6KDT+CEmlsXeKQ5fkns3wxWOU6aCZLT3xKV9njcep6M2sreBG93D+Fob
	Tg6IMa8I26R70c7wtqKcQPrGkU7K3shOaJJ1QyNK2cGV7A1xCvLzBO1sLFVn1+PG/JNGidSfwQ/
	8b0zguBHSeG36n5/icEHMfCRv9Xzbk4jTCiMFXbJzuONoHzu2zkjerY=
X-Received: by 2002:a17:907:9811:b0:c46:8b51:c17c with SMTP id a640c23a62f3a-c5066a83305mr467351966b.17.1794489552581;
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6dc3sm350140366b.6.2026.11.12.05.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:19:12 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Thu, 12 Nov 2026 14:18:59 +0100
Message-ID: <20261112131859.339060-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111195559.160650-1-kudzo51@gmail.com>
References: <20261111195559.160650-1-kudzo51@gmail.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

I have now run it on a BCM43684 (firmware 17.10.188.75) as an access
point, with the logic of your 4/4 and this patch ported to my tree (its
tx status path is the BCA one, with the flowid and generation kept per
pktid), plus counters for the test. The AP sent a client a 150 Mbit/s
UDP stream while the client was deauthenticated 60 times.

In 62 flowring deletes, 2130 frames were out when the delete request was
sent. The tx status of every one of them came before the delete
response, none came after it, and outstanding_tx never went below zero.
Here too the host saw every status before the delete response, as in
your BCM4377 trace, and the generation check did not trigger.

To see the case itself, I then held back the tx status of a flowring
being deleted for 3 s in the driver, so the host handled the delete
response first and the new flowring of the reconnected client got the
same flowid. With the generation check, all 531 such statuses came for
a reused flowid and left its counter alone: at each of the 15 deletes it
matched the frames still out. With the generation check turned off, the
counter of the new flowring was wrong at 14 of 15 deletes, by 787 frames
in total, and went below zero.

One wording fix in the patch: "This happens whatever order the firmware
sends the two messages in" is too strong, it should say "This can
happen". Without holding a status back I have not seen it.

Kordian
