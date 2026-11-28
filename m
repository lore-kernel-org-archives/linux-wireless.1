Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881815;
	b=hF/NBWSbim3qm0R4TdPIJQ7K9SWZuTj+nRYBDBQPhfbMiGDVYnK43qhQ6V+39bR/S8J1
	 lqgbtdUjSt4ezuPOU4YIEN31EonIpN0EvwzNAdLn7JUiCugp9LOMFZ2QdCfuORR624Fmw
	 qE/9NWaAQk80tlb6b94Fe7QKDbdEgZmslzNWm89oukaFIvX3k2n5xLinG4Bsb1iZID6X7
	 cG8qQT0h80elruDnpQzqOndyD0gL+1Tt5QXuDAEj4YyQ101/4+YTbGgi2yvvAJvwOAfwt
	 yED02Ms0k8NowUFbTfkYye0xH1WcTGg/JZCTV0T77Jc1uZoRqCPfslvGy0g01F7E0nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
	b=qtuS8069ve5QIrLrSKsJiFFGtykIXj+llLBudomQfO2Vr85FC/yeB3cUisBpRWD49LCi
	 vsalP8ITbBkIeTyUXEGc0tpeYzH9O+X6ETskmMJDPWBGsqYOJmO21NG3edqWa4QbdYlT4
	 fCID+eDjQADS65+Pjz++jWxoh3zrKYUVai2VPeAP32fGUJ4kPuIKT1Cs4WApJRUa9iXxM
	 vEaYOHSD4wOs2oTBRvoIj4CbytsAW2iEgCg74wOb+RAVUYZQF7RCR0oi0qHaGahMQGyr4
	 s1X8Ug6ESgRXPNCpmm/siyVVYiJug0yGwjJ3MAhdJ6I3pVYTWOe1wOd27SyMJjoaFqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oyEAUsMC;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458EA606A326
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 458EA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oyEAUsMC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5188e17487so520422466b.2
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881813; x=1796486613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=oyEAUsMCC+7PlKIgQYpANYuQgqCqoj9CLvT2afDidmOWgz1kt/+bGDqEPqQM2LutNG
         PLM/r0cU7O0zJh4AtuYUV1QGyTj0ymVmy3m5JeQqhN2+QrA+aablZSVU80aICTIR1Ax/
         BK8jqCxfwxRUA1ys2eStluL4x1Fz9p52UoTu3I8+lwqbataqTXKvkyIQ53Z9XwUML5ig
         iokfUkW4D0gRkidMzt4ZBTMaQ4hNaJbIlQmn07m+jtBw3kTiMrCNTK+m1udsCaOfM7IN
         y2e9LeupMrYpgVCAkTWal99/TVdcl4zgGs4Y0Yy4mHuBmKtAaMuMydfniuHWS7IQgn++
         +6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881813; x=1796486613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jn0WIQtZdJurxbejP9J0z7bCDNe4zly0+yOqnjn0IHA=;
        b=Bw59fSA7RlXNlJinawx6w0EWUq/DEHxjn6otQq3LgyLfww/7kCRNVtyHnyjNBmHz6b
         nA5N5DCzxMA1eqLJeO4cx0Ygl4CbP8TFAFh5FJERVcWE8dOQyJAMBc+qJW2f3Qgs8/YO
         3KXzj4xbpmeXq9GIk8ze5uk+SEdMm2xNaNxQn9hiHGqMfXzFDH2nDoWr1YqgCe1oJh13
         GbQSpBn55nIY5ap43IWQqJ9MjnnWyZJtBuDBSAcMgXRFiAWSyeqMqxSRp91a7hCL3LPB
         s7a6etMYKA6wGjW/QA483jxryjQF6l4xV8GCpODB3eQB7MxfUlK2x13N8whswzZBWia5
         wrGQ==
X-Gm-Message-State: APuU4Z/rp5Bo8W3hQ49y8o+YsI+KQvC8bnvGMo59IxfU0A1IZlxlVtTS
	NNvntBpCXU+aay2JBmUqA22XJIh4SkHLxC4JqK1XxkI+aowExcKmZ3xxB/5uJSDdsw==
X-Gm-Gg: AZFdTZflnlAnTOydBefsOWnBJwBdFm64Oeo/bK5CkQkpGLrfoTRlPIcqMt4I3LaaiQU
	rz7PfsbbaqTYRw723vfXqB8GsV+5t+xMQH/BgoCtqjA2yyO/MfvEkKUlw6iM0lUSCjvTNhDVTcL
	yYTk8aFcV4F0NUy4D/OsWc4sl3EN67sM6vY1WrNSR4cGob0QZht43i6qBGfjF68bSSq+7W7uuc1
	f1KajprCQ+gsLIt+a4n4HD6I2O+e7EZPj/GqdKU+/u6E8Mvjkffi7JI92Sa6F7PwT9HII8fILFC
	u8VKN8cdQqB3OyeSyB+qyT8xDH8VItdm6dXiUDtoHUGp0o2tDc4Sbq/mTthaSCMhrNkku8QtD0w
	X9Arvf+orYW75WeK/MDlh2slHpddCYjUFQJpsVOQ6DuVnZDZhFpfHmfSyHxGSAuo7DONKqVyDMX
	vnYWgE6uf3vv+al5aNMcw15obaUIB3+cqYSE8YDkiZ6xzh7ypQDyuITjgCoppqa94FPDlXQQYmC
	OeFV7Nim53PKqUCwUlm7KMM5e4/TCE5sCy/6R/nC5H3/OgAw6R2bMcWTtrYGLlGEf7smWjLCmNp
	ntB00Lzm2V3cJ4zLblP0I/qltki+KJuyQ5ElTE7/80r8YwqCXYH5o0erXFdTT1FloW+FS8EeRw7
	FbAAV3FKwr3wNvx9UVhmbCor4lM5PoLtz1vg5R5tOFghFcXQ2rAEUa1WaPOkNun4HFoa+jWQsVB
	LR6k90ZreBupsKP9nVSaNBQvIfey1ZWj/meIhVTDey9Xm6GHMqIjsYRlSDFLCY686PLVCqofFNj
	u7KnYSlVAsuwy1mxRNKuLgXTZNMtpH7pId1iT1EPU1uJMS5rBEvEqDrgb8GrS3yQypJEYRZWZVF
	BDIZjRX49nsTFaE=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr2433115666b.4.1795881813536;
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:33 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 1/7] wifi: mac80211: compute the airtime estimate in 64 bits
Date: Sat, 28 Nov 2026 17:03:29 +0100
Message-ID: <20261128160335.1815537-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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

ieee80211_calc_rx_airtime() and ieee80211_rate_expected_tx_airtime()
multiply the duration of an AVG_PKT_SIZE frame, in 1/1024 us, by the
frame length in a u32. The product is the airtime in us times 2^20, so
it wraps once the airtime reaches 4096 us. At HT MCS0 a 4096 byte
A-MPDU comes out as 945 us instead of 5041 us.

mt76x0, mt76x2 and mt7603 compute RX airtime in software and pass the
length of a whole A-MPDU to ieee80211_calc_rx_airtime(), so a station
that sends at a low rate is charged a fraction of its airtime.

Do the multiplication in 64 bits. Where it did not wrap, the result is
the same.

Found by the hosted Sashiko review of v1.

Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
Fixes: f01cfbaf9b29 ("mac80211: improve AQL aggregation estimation for low data rates")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New. The GSO estimate of v1 1/4 wrapped here.

 net/mac80211/airtime.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index ee5dc524347c..55bc451d4a9d 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -616,9 +616,7 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 	if (!duration)
 		return 0;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
-	duration /= 1024;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE * 1024);
 
 	return duration + overhead;
 }
@@ -813,8 +811,7 @@ u32 ieee80211_rate_expected_tx_airtime(struct ieee80211_hw *hw,
 	else
 		agg_shift = 6;
 
-	duration *= len;
-	duration /= AVG_PKT_SIZE;
+	duration = div_u64(mul_u32_u32(duration, len), AVG_PKT_SIZE);
 	duration += (overhead * 1024 >> agg_shift);
 
 	return duration;
-- 
2.53.0

