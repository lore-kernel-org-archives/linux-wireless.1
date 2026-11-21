Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.36.144.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795292665;
	b=3sxI5cJQUMZSKOu+GywVf8rY+hikXjt3WXvhnAbzQvwGe04OC5jQzik/fRZJYzoyLnVn
	 iKECfBRn6A/rGXg7/mq67Rp/K2dTAZaoqklUAchQsnj1yqSfb8gn9ndYRbARClyJa16Ni
	 i1TyZ78NJjtT8TlCgaC4pCZZ6EZxhwVbHUBrJKBF+dC3mtpqVd0eUrcVNHeSfQ82OAWRt
	 w2KNkCTzLENVUP6tknz5TUpJ6yyGVCBMUKMMAPkFMPb/osWiJh6LG2e9wPt1VKlWRfk95
	 Y4PYKDMyYx+XWYEoInyn+LDM9eXXND6GKHeqeGF0km+y5IAauBKpsYRs/TULMxgjquQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795292665;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qVTGOF0g2lYLUrQkFxW8jn3nURBAzDjEGsnctCt4OlI=;
	b=tc2oj0Fk0d1FoTD4pk4dXee0lG1tnQQ2Ixo1L0XI1uU51FVRVlGWquIyIfteovylpMo+
	 xjFNTLqrLjCRQv0d2VOUpOjhL2ZZrUb7t6rnAxW5/8YIa1pHNu1nwYoBVRKdy7qfSzfNp
	 d1I5hiVWrT1R0Se3I/zG1Yl0jUjPiChyzTtcSvQmMzV13h5V2laR4M+rq6qs32m3GJbZY
	 3LhkfJeta9LutAFRToJJzn0aTa1NsurNuJx80KQg03BaHEkDNq9Cs1lrEy0cGu4lbSQ8z
	 uMH7d9H0Y+ofF/bgNeo29rwiqEg3zWBPvQwNTyQTskwU91bytBHWfpFdSMCqO8iOk3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yoxcu.de;
	spf=pass smtp.mailfrom=yoxcu.de;
	dkim=pass header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=r53HDp9s;
	arc=none smtp.remote-ip=194.36.144.171
Received: from morty.yoxcu.de (morty.yoxcu.de [194.36.144.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A942606A320;
	Sat, 21 Nov 2026 20:24:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A942606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yoxcu.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=r53HDp9s
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F4B51D87176;
	Sat, 21 Nov 2026 21:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795292662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qVTGOF0g2lYLUrQkFxW8jn3nURBAzDjEGsnctCt4OlI=;
	b=r53HDp9sQ+A2FMFvgrbb5uczUG7JsVKJDWMx9Uy4h9TFRbnnXRCv0RvsKJy9rNZCCaN3t5
	ftNh+JJaCtBrKBx4Pb0GY4bk90mUqryzHfjG69AIVW2qP5cFs3Dz0ST6oZ0hHxRaIic3cj
	XaCriiwMaL90OTJWIfxI5pY98XWxufTXl8l4hZpzXH78dTvVkCklQGyI2H2gIA7HoscI1J
	+Jh+I9aP+ShykT3SVi7auCtv8BcOUCZjVDg59Rs6w8XANigf0XnFNJp1L9ixgBZ5XNJJSL
	iK0EJAleQq3tUaQWN57yMkqhHIcu/N8nGXAlK06Re/uyIM4h5lLaChmURvHXCQ==
From: Michael Auer <mick@yoxcu.de>
To: shunsuke@nagashi.ma,
	Jeff Johnson <jjohnson@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>,
	Fabricio Akio <fabricioakio@gmail.com>
Subject: Re: [PATCH ath-next 3/3] wifi: ath10k: bring down a station vdev that never came up
Date: Sat, 21 Nov 2026 21:24:15 +0100
Message-ID: <20261121202416.841461-1-mick@yoxcu.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma> <20261016-ath10k-series-v1-send-v1-3-c847697b3558@nagashi.ma>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Shunsuke,

I tested patches 2 and 3 on a OnePlus 6 (WCN3990,
WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1) on a 7.1-rc1 based kernel.

Aborting a connect before association (Station.Disconnect right after
Network.Connect in iwd) now logs "down (never up)" after the vdev stop.
In the 20 minutes of suspend after it, the modem was in sleep 77 % of
the time. Without a fix it never slept after such an abort (0 %, the
phone drew 103 to 205 mA in suspend instead of about 20 mA).

Tested-by: Michael Auer <mick@yoxcu.de> # OnePlus 6 (WCN3990)

Normal disconnects still keep the modem awake on this phone until the
next connect (0 % modem sleep in the same test). As your cover letter
says, the series does not change them. I have a separate fix for that
and can send it on top of your series.

Michael
