Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.87
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795894931;
	b=WbA6GpfLFya2ZynM2CzZ+YIdQm6tW+hJHzu18kgPc7FgTM76Rgxvi5tlDYYK0j7r29TN
	 ogHOS8le7iywhpk6w3YdUXfijB3QQMU7MekqiiYEpMkGM4rnwwNZkNgV6Stlt2d89BdEe
	 jW0TD7yg1uYSzHXKWolbXGyI3+cjL/J8VpVTg31q9pc3/Fh26mXFNipy3VO/8xA2Bk8xa
	 sPl2VL8nbSUeakYUmrANvH3Ku7MNnDBualaMNzr1pocgNWEKKXkV81uVBNCw7p/yEmKbU
	 LXxdahO9+Jyrs5pGSUrrSJhde2KtazCz1SN27u8ZAFNJc+oEyp/IE8xRZmsXVWCGqwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795894931;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t2jR6JHgK1WZ0y/FBfxCHPJnW3Yf0ivZTRRaWEhbcVY=;
	b=d3DBMxwk1jyY2JcNnSuuUyIWUGTUzemiU8xm9PMTCKBVBqJLi7jf8m5XGk8gaTUoC7Fj
	 BkrezfzU6cK/RZwPF956ZEscdUS0ZdGyzdfX6ehzIpvD0L3EX68AubWF0oCI7YZPfKxsH
	 MA5Bd0LkhiuvoOwFEkboso9GwhdMs5QndMYCnfFXsanF57tKHpAQgLV2YLNUsM9ktT1mk
	 rZZXNgkJ/S7e6ExX0vE5t+0NHniKZMrf6XkyjBX0CNJbqhZ0QPUA864kJ6nNKCgOesn1D
	 8yT0fw6dKQKfNn3hcoVZpQOw+7upfDOdyUQXp24B8JDczr/zofPIh919Ni3Bxa48MIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	dkim=pass header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=sygYHDqS;
	arc=none smtp.remote-ip=95.215.58.87
Received: from mta1.migadu.com (out-87.mta1.migadu.com [95.215.58.87])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DDE606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 19:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DDE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=sygYHDqS
X-Envelope-To: linux-wireless@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+rK+Y0F429HEkcbGS6PvR5tqK+tF3MtdZxwAEVsgIjw=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795894928; v=1; x=1796499728;
 b=sygYHDqS93UOimLAWadmu+Vp/qqaQedyfmRe+LSav4NFL+Ptajb/W7xPFM2wU3Ej4yFLbbZG
 sJ/CrWrR3zS3qBaPPkV1NgkGdWTCquFUZMtMlui7KZwAYuIE+e0twl7+zrKFjWMwL9bv3Ey1s3t
 hLy1oJj/3uWXUOO+R9joySXgKZpYQ1JpSUN/TuK30zYvZM96LA5gmGE2wQtS7nKiz0jeXO+KzOI
 G7DHMNF3QgLGUvXwvxQQl1+aHsM9DdecR5Nt7o1xc2AyaW+GVYekXcOTzXyMafsnQ/qG+ntyjEC
 aXR0NiQR7En7zhq/STXb8VtuCT2vddUS+mXVMLgJP24qw==
X-Envelope-To: linux-wireless@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c5c5445795f35a85;
	Sat, 28 Nov 2026 19:42:07 +0000
X-Mizu-Trace-ID: c5c5445795f35a85
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Aaron Beckendorf <albecken@mtu.edu>,
	martin@rfdeck.de,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76-next 0/4] wifi: mt76: connac: honour more of radiotap for injected frames
Date: Sat, 28 Nov 2026 12:41:52 -0700
Message-ID: <20261128194156.112602-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261104142737.186484-1-albecken@mtu.edu>
References: <20261104142737.186484-1-albecken@mtu.edu>
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

Aaron's v2 makes connac2 honour an injected HT or VHT rate. These four
go on top of it.

Patch 1 honours a legacy rate, and patch 2 short GI, LDPC and STBC.
Patch 3 sends injected unicast data at its rate; today it never reaches
the air on 5 GHz and goes out at 1 Mbit/s on 2.4 GHz. Patch 4 sends an
injected no-ack unicast frame once, without the RTS that an MT7922 on a
protected channel sends to an empty address.

  tested on         MT7921AU over USB at both speeds, MT7922 over PCIe,
                    on Felix's tree; not the MT7915 family, which shares
                    this code, and not SDIO. Only injected frames change.
  injected cells    78 of 79 per chip as asked, in each pass; VHT MCS 9
                    at 20 MHz, which 802.11ac doesn't define for one
                    stream, goes out as MCS 8
  floods            every broadcast frame heard had short GI, LDPC and
                    STBC; over 99.7% of unicast heard, none before
  managed traffic   no change beyond run-to-run variation
  active monitor    same results with my active monitor v2 [1] applied

Not fixed here: on a protected channel, an MT7922 still sends that RTS
before an injected unicast frame that wants an ack. Stock does the same
for injected management frames.

Aaron's v2: https://lore.kernel.org/linux-wireless/20261104142737.186484-1-albecken@mtu.edu/
[1] https://lore.kernel.org/linux-wireless/20261123152154.99634-1-lucid_duck@justthetip.ca/



Devin Wittmayer (4):
  wifi: mt76: connac: honour an injected legacy rate
  wifi: mt76: connac: honour injected short GI, LDPC and STBC
  wifi: mt76: connac: send an injected unicast frame at its injected
    rate
  wifi: mt76: connac: send an injected no-ack frame unprotected

 .../wireless/mediatek/mt76/mt76_connac_mac.c  | 52 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)


base-commit: 87868333220b542ff6237c93abdca84c71337f59
prerequisite-patch-id: a160a9f3f609e6118b1e2336b0faf074d186b036
-- 
2.56.1

