Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354953;
	b=vaR+nWV0pkOVdK3Pv62L/ST9lejsAqofY+CSrEh04nCSgN507Oe5R1SJ1MRxJMoYxJNO
	 AZCMy/e6MA2HJWVj+Khm1sB3uy05Yeh2C/W+THBcXUAtwmttN64kyuQ3kTAjEYHSXs8fj
	 laXw6y/pESQbECb3dZihCU521WZ4KjuDmtRIjooV4JAznZy5bHD7JYoDi/9hDL5egFTqA
	 TS2pgwg2ts02OYQLR6Qm72/l4yd0PEzHWcQH6zG5k4m6bMw1uAoi0vpVw4lpGg86PENP9
	 3PO9TN7U1aVJhmoOlmGYWXd9iblMq4lyleunLcxBjHTZTXBP/3pr8VVTYRTqolr3M6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
	b=FYcppE+uFcFHMXtDvkNAi3umJqPw2g2oX9UowvQMJ/lkHySXLihUUMvKNJ5v1Q4Zo9O7
	 zP4HETseoYUVvyZivqO63oBhcZGHsDdiE6YdYT227+4t82R9ucMr/QYfv83/hE6MgNYjg
	 AWp7TZEFoCQZQCF/GtB5Td8BHdiUD3p+txa3vJBVPSu0Q3kKhEhJsd6JDGp8NxQ2YN0R+
	 2g8GWEA5Bph/MNcHhJ+5z1T6bFH9tHf9DLUD4HCON6YpLGKlFJrwkP3IUShKYjs+fUEvR
	 cth8lPOY3COmQjsHuUCTKBysy9HJ5Xtj6Wv8L1cTtUcmqJqMwlBUgDkH9YXWGe8o1Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xuoFMD0s;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591D7606A69A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591D7606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=xuoFMD0s
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so3217138a12.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354952; x=1795959752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=xuoFMD0s6RPjtA3eyT71Zkm+IFUP8NLNBiQQLa4ZjpoNtg3uWI6JA1FUQtVH4xOnrH
         o9SXWjXqg5xBKaDQ04/Kk0pDrSgkfPWrl7/wjpQneZ/L5YwtrX10kvRUHQd4wEo+0X/s
         3PwxgvZjXch7Xv1MIIwxApBXoAGA/xcbTAr7bV0r9mxs7ZokeNilfVNCxcAPOxUJodz9
         BGFDCm7bycovpS80QtDtrup9DZT9DBnLwHg9neiCbwmNn28vo+ya4F7WLk9YsO2dVZRY
         NWh8IbW+2LDnRxS+RDaoCY2eN89E8Q0yiLDyfkGA7hqh5GoxyWCBjHOAGvpt+sEGSRoR
         tAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354952; x=1795959752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gsbux4xB1cx2A5qfbVry4VrITyTzzyacDp3E10MmRsQ=;
        b=hqFjulRSxgNbI74hg7rAeK+1X1R9MiEqlYAByrHyuTG1RaBQsxKV3xb4RoaldMT631
         Ebs/wjDJvrArGllaDGCjna58ey/Vs6C0tdCpqD+SS7aDq0d3q/JrnsFSjfYxLOBYV5vX
         /Ah22oSfpwB0K330vxOXLxwF7x6QHvyWAOd+72dW/jrm2ILGpxE1LQZVyurxWr0RLIIf
         DxLaTgQ0jSHwfD2Go+EZUGHNHfoQygLW578AGrTd946MEGzp2Mf9LFNOoHciX2tlTYl7
         WRcpHtkeVIyoSBpXS/8ledEJc4lSW08gEbcQL4BlMHIRvqmi7DK9ERcLiy9GYbicTxO4
         W+iw==
X-Gm-Message-State: APuU4Z8aXxPu4Z3arLzXUiSBifMhS+CTzRKZnjQlh2OSbJDhUs9S5Ew6
	sRtysECpJH0rUOZ2aZxUmCHpWCR/+lLMkP72SQCgyOjcctCc02ezJj3bIEv2d4m43h+4XFX1GYW
	KlMbLvI8I
X-Gm-Gg: AZFdTZdHuIVSPMXspDfPKAaRAo6qU6Q3yPUQsq7X9bVXSCeqhNS2rZqN7v5GCnbzPaO
	yEj8NlKevrHp58fBueOtRjxHH51W8bXl5nvY2y0RZw15ftZI6m4tEsn9c7p8KCrGZw5PnhG0+ps
	OSLEAcU8cNdsgX7YIpodo84j0IZvYAfr0rxZtnVVO5Ym96Pc+r5pZBz0oSbAu9WAWbt7/jXpHCp
	rktWDNfdmXnaWKeR402/JWKYJSbk4x4oNA5DueLB834jenEjJ6ueI+MVctpNis9POFRBJ4sX8/6
	J+NVD6P6gKHszOTVv9cfbGwR6p5QOrtfa9MsAI6p1CH/mti4jlVvDsXfOyIFi9OgRxPHt0ojqHk
	wsURt+pt51n9ID06aH1D5Q6ilXtsdgqUurEOpv/ehoZtbmmh9KuFWHi6nCglqe1iZ3m1T0VgiO1
	oyZKB0LJsjPT1BYhlejGYmGAKJPr/ZFRjvxgGgpA0HavMD6lzAVjA9fs/p96p6wQgFO3lyoGnRV
	3KI1v055BX47pkATjJlwHpYUCHAmHdJMSjEBEhCeTrTYdp5QNFbWAzzNvOIAGFtH4TkJwvXfGSF
	6KPBARpeIKB/zx5uEZXvVTyjFdixRSPXc+F+MsIEl3Or8qMsUfNYYAmchHhjoDeKkWODPIYkuw8
	nTsslSCGM52277SXrAG9SIwjVVc6VgF1Xd6njC+w9MMfzZdJOfcjcgqtmD96DOARvs388a5TcbP
	dc1M8YIcyMsc+EoCOKzqiSlCxv3c2g1TCIan9SPkOWLNr3DNjzEu8WVlFFuvXMnmeQkNKQvGeCn
	L1fivZ9oyg5Cw62ojW3ewmhEBUM+C/N+LKLMyR+TvQX6DE46N+UHejpugR8ZVmd/wM61Tvbe7ov
	e+IIKneYFqnLSPYVCmswVKeVpA+ZWFsdE+4O6QaZ/T2QMYcrIp2f0Ws=
X-Received: by 2002:a05:6402:2745:b0:6ba:9d0c:cca4 with SMTP id 4fb4d7f45d1cf-6ba9d0cced2mr898964a12.33.1795354951690;
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/4] wifi: ath12k: pass the TID of a received 802.3 frame to mac80211
Date: Sun, 22 Nov 2026 14:42:28 +0100
Message-ID: <20261122134228.956044-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
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

ath12k_dp_rx_deliver_msdu() delivers frames with Ethernet decap as
RX_FLAG_8023, and mac80211 counted all of them on TID 0. Pass the TID
the driver already took from the receive descriptor into rxcb->tid.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 36be543b7c50..fc381945d163 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -1413,6 +1413,7 @@ void ath12k_dp_rx_deliver_msdu(struct ath12k_pdev_dp *dp_pdev, struct napi_struc
 
 	rx_status = IEEE80211_SKB_RXCB(msdu);
 	*rx_status = *status;
+	rx_status->tid = min_t(u8, rxcb->tid, IEEE80211_NUM_TIDS);
 
 	/* TODO: trace rx packet */
 
-- 
2.53.0

