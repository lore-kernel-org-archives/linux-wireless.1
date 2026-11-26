Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.108.69.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795727830;
	b=I5c1XUfJPJFvJY9YM5Ym9pYgUxCD89BooUnKNWIBWUAA5of0T6LDoBH21k+aeFV4UP5f
	 /w7fJHyvbua5OJUDQJaRW+0T59Hc7Y4MqbTPYiMWtK+HLZq2a40rcQCkldlW4FPxcmsia
	 hrjOnSxlWf4eQcObz3fLfsEQ1pInvcx8D3RDIc3I/0uKDrtoubQJ3baixabpczjfHhl0f
	 PVrJ1niuJLhhxbBK8WXwMEZDVaMNxSY1/qJX1Gfkb95GB+w70rrGZ9gPByfCJ2/gKa6Dr
	 7ZXOAHDAyDEWp9oWiS2N9yMKyzTy7vmN29XkhDPLcEH5PHA2MtbxUu24ehEDbHFeCiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795727830;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version:X-Last-TLS-Session-Version;
	bh=uyDi+BYA5cHdbyu/UIbRvTjqzghT7Tc7GiBDYym9dQk=;
	b=XjCoK3dxSbJI90O4EMDV46xa4sKEND+I8bGQBL+AXK2GtJLAjfHCPtQ6tu2Pde74n5xv
	 kRofJ2JE6d249FRfINTz8L/W7Vhqx1/1f/JSwxZ4Iz0zol65ocXGCbnXOKKVXUgcxCJZl
	 0J4zV8LUXJ93iVR69ucerOA71Mo/RhQacwqqsuyBlR89FFs68wNlmKb3G7kiWqoZQCmmO
	 gC+c+hJLmA6AHr5lLijji5gmVnNDsFfXCAZmeGDjiLEK2sp5TYfBdjeQdeAu6KyVKVpz1
	 o81voAEw7yVDz0zs/cmfK89YAlfO9XmpWqf+RY+xKNNE1Y12k38722YFLljO3FsPlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ffdus.de;
	spf=pass smtp.mailfrom=ffdus.de;
	dkim=pass header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b="W2rtK1A/";
	dkim=pass header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=O0Xij+gK;
	arc=none smtp.remote-ip=65.108.69.237
Received: from mail2.nadeshda.org (mail2.nadeshda.org [65.108.69.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06788606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 21:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06788606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ffdus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ffdus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=W2rtK1A/;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=O0Xij+gK
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB3CF40454;
	Thu, 26 Nov 2026 22:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727828; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uyDi+BYA5cHdbyu/UIbRvTjqzghT7Tc7GiBDYym9dQk=;
	b=W2rtK1A/h738afLTuA1J44/+hexfvLN+v0RDa5ZLeIavuEp4Hkhufwou81Nne76CwjRY+0
	f+LKLKRnOr4/EEyJpDM4yhgZGDFs5UtidVoh24lwTB26G6f9i3VpPFDFUr5Vl0+0v4LeHJ
	LhqE0EdHzcIsY9TwQNuuDIIvPmvivUerTLugYYu4XgSI+vPj95/10S10YkzzRGdgZKyNf7
	6+g/L/92eMc3FIYnndB/9xB4Um///NyouwPg68IVlwE2nSjFezfZD4eTUbGE+S7a9MV6t2
	puoc9c5qWevbpSPuXM9rg5p4JPXopmxgl00lSbiyY0WHaEIOJrz4jHJ3Z2GnrQ==
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DF9117A1E1;
	Thu, 26 Nov 2026 22:17:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727826; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uyDi+BYA5cHdbyu/UIbRvTjqzghT7Tc7GiBDYym9dQk=;
	b=O0Xij+gKohA66NHLzwOWQYIqV0VfikWjZssg3xvaroTjgW1NML3HorD2Igr9AICFWMuiWY
	1JjYOu0XW/xcicj8TRu3jjGyfv/7W+2uWd7VXW1tZRXqcb1G+sC/m6cGrDLndmOMXVo/t2
	n3R8OqyepqOHH3xQ1n89n1tvqLkIErh0lTorhIrhFtkd++lOn3qjYcqvfHKd9NcyN6ym3l
	KWozmnz3XROa6swtgaS0Yv27pSjRhtu32os5QkMk6wsGsWyJu/ypVq+irnUyNLDsJFISWG
	xk42CcJZEK8BTsZnsZm+zIpzMjpRSen9Lp0xSaXoygu0yL8dvPYxtxXW7W/7Bg==
Received: (nullmailer pid 3958945 invoked by uid 1000);
	Thu, 26 Nov 2026 21:17:06 -0000
From: adorfer <ad@ffdus.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath11k: invalidate the REO queue SSN when RX aggregation stops
Date: Thu, 26 Nov 2026 22:17:06 +0100
Message-ID: <20261126211706.3958936-1-ad@ffdus.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125090320.3890628-1-fmaurer@disroot.org>
References: <20261125090320.3890628-1-fmaurer@disroot.org>
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
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3

Tested-by: Andreas Dorfer <ad@ffdus.de>

Tested on Mercusys MR80Xv2 (IPQ5018 + QCN6122, WLAN.HK.2.7.0.1-01744),
backports 6.12.96, with the mac80211 BA teardown patch, open 802.11s
mesh with ath9k/mt76 nbs. 5 reboots: 959 of 960 mesh links
passed unicast right afterwards; then 624 of 624 over 2 h without
reboots. No firmware crash, no REO errors.

One 5 GHz link to a mt76 peer shows short periodic gaps, with/WO
patch; your A-MSDU patch planned as next test.
