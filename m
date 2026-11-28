Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881817;
	b=EbGew7iqGS2QJsnIZ6XDZZRaUmBA2YfNmXZ8URpLEmXqk3JNrao/8AJ2TopiQrCmQ5YO
	 bZs2R8u1RnxpLNrTO0VNSUynf5VMZ1YUrOtpfHMviEIK4eF+cfwHTrshCVReeX8XyPUoR
	 XLokwnm0f/aXSNiIKNHy4w99l/KRWp8vZaYtusR1bclrStnnPh/RQChNha7pZ9AvtHFOt
	 s6YLWU6xUrlaVGS/pTKmibJOnrk1mc7fuehg10xaBIt2b4e41b2TT4pbeYsrcqDoxxWac
	 +gpvakssaJOwbtxLLW2/CXDkF5ZCx2X8614CmF07fUGmiHH+sFEi1qRDPojzoC5yJfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
	b=5lsE8rtLO4T2gTNjfD+md6Y3PadVpohikrCssc6VEKrSpo3CZYZmlC5pbJXlULaI6Ny6
	 Tt64hQ+hNwShjEOfbXRSaW6SgO4Xfy9H4Vs+YKJIN40G3kJsWRtQvS9HPhjzYfA1+K+To
	 kh8ogXqxnnfl9ys6uImoG2kNv0G5xkGomwLv1apOTa19UwOcN88fZiR/f5XhV4ki0rVll
	 0jXxiBOmNN1ONDq7B0myggBLVOBfYw7x2adJVu/2mWuIWREjdNEbpIlxYNJoph6n8OWag
	 dg3CgSghBUN/b/5WnvRCnK74inbbP6CmUAgJM9k99KNbCXr65TaoI2KbD1X5HeK89nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ilMK2C9g;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A58606A686
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0A58606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=ilMK2C9g
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so533640166b.0
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881815; x=1796486615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=ilMK2C9g6rVfiATl44chV9H2FKBnw7kDzk3HUGnproo1R0/aoXT9dTPOEKxIScwtdv
         TNIPJXxBERRUjJX0qX4ahuBDyDxpD12YKWEcY4VQPzVaekB50PZLbT2OegJIAs/rRDRL
         V7TDVEsj0amXEzUmjRIBZWW7XSYiywn3MHBInd3S6+SSzMNws9rCG0219GUwLdOj7eIr
         5gmPIcCVPQhQFmKzOh2Rtc2zD9L1dyM2LPRAxJfXe1VUSH/kP9ZUBCayAaiM8nkdzz6g
         VnVOVkCD2Fc7mcsWq5GBmXPatO5cs7Ek95sziKpkwUYTnVLBH0w5uSPvphbEAxXlFss3
         CQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881815; x=1796486615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=deA78sky0Ow8MosCfCjSBlFQwGcUdxjZjP/csRIUIIA=;
        b=tT2+76ilDyz7CZ7+HiCuG1HOFZ79YKPF/AFxJOrP52vVJX+sUn2Gfe/AVwdRpxbkqQ
         Rl8x41rnMOa7sIQeKqrE9h4Ru8Jn9FEop+VSmH42gq1ad/Iw9/U//oaiHNHsdfsTFYqe
         rYWKOG+PBf/bfaKC9zLqSoMHscduFP5+WHAgwKBQxck+PZi6xbLv2YjVEc3UIV4jpWD2
         2M16e4Ss36z5efQGjg2VaH3IGCZ7b7rPgtJRbqITnYScBIQplcv/GGbPmf4qJeDdkyPP
         GIOXF9J5hZhrmP9PAzb6+TZbFHOqP9BhwWBqjfkXHpGu+p7+2Wo9+EUz072Rq/m4hKOg
         jEag==
X-Gm-Message-State: APuU4Z9lTvLKcfAesmymBYZYpuHI+qMAk52MSlt7VgKD+/2L7I5Z6ZIi
	dH17NKBhQjJbATaItK3NIvndcZY5lwwttNKj+bKgPO3j6tNwyj9KhIEs5unW3IsUG96bOwuAq7o
	7mfpV/Zaf
X-Gm-Gg: AZFdTZdQ4mx1Bpgjm/B9taXaKbPc6fjFgzQRRj+Ylha0O/hqBltGG8AMqzV/gYxx7jL
	VqcaEe4Gy86qNlJFE9yFOMwDguP1YjLrEr2pgDsFVstmbFvwsBtNmdy9uq7RZgWxowy/7S/Ejma
	gJlELEeQUVUHzCmL5QKo9h1NNHkFIB8JkiFzztLWVFqk4GCqzAaeu3pta0aH954syqegWCirsMe
	LWp5dePsPqFov93LGts7CbFc8fPJrtRLYZUfi5mc3sv5DCHYjzjojy8Grl0iOZ/0yEcGmzzPDs3
	QYljN2oHdgrDmdbqK21c65Kq5/F8PAgNeSNOQpwEaPIkymQyhm6n6zpf5wzRju0GAw05Id3Arnr
	caeB8Oy4rLZmCw92qve0JUDIT1HKMyKu7Z3OsqJxY+ZNSyBze3NkA0qhr7qzhphGbOm3FZy2T1r
	KiRifuCnJ384VMwahwhyfx1aV0LvnMKuI9j43NSEWhL7I1eR9fOSlpOu9wHqCef2UwofsrRNprZ
	+rAOghh5JS9V2Vuj1qXmxcqf/SO51V4lXje6RFQI8lCDX4OhhI4y9GtmegEUDxFQcL1yH35JVQd
	YQGmTH2vttiFMc/XksbgbPLhIelzcDTcLIChr52j6obb7rUH4LahwjUmRZnAwKmbdzvBo2jyvoY
	NrwOQ7YkvXfuY6TssPEePCvEF6pYkiPJH6HDuftedq87BPyTqOMitCrJ8Ber8up6GYBE95cgjud
	p+5m0aAkDLP0/puFwDNpwzfM+EPTKeBXuAK78gVzgt1pZK13oNeq1Y8fdZQkqDmQIhkKXgkZhMH
	5roxwZfSFa7I9kX1bw/DYYYwEsYbvIiI3YXtFtC4aotbxYGwL6AgenSuCqprbEJ8auvNmyMsRv1
	WAnXIIGVBPTr5w==
X-Received: by 2002:a17:906:bcfb:b0:c40:b59:1b with SMTP id a640c23a62f3a-c513aca41b9mr1650900866b.44.1795881814994;
        Sat, 28 Nov 2026 08:03:34 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.33
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
Subject: [PATCH wireless-next v2 2/7] wifi: mac80211: use the ampdu argument of ieee80211_calc_expected_tx_airtime()
Date: Sat, 28 Nov 2026 17:03:30 +0100
Message-ID: <20261128160335.1815537-3-julius@bairaktaris.de>
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

Since ieee80211_rate_expected_tx_airtime() was split out,
ieee80211_calc_expected_tx_airtime() passes true to it and ignores its
own ampdu argument. ieee80211_tx_dequeue() passes false for a frame on
the VO queue, which AQL is then charged as part of an A-MPDU: its PHY
overhead is divided by 2 to 64 instead of charged in full.

Pass ampdu on.

Found by an LLM review (Claude) of the airtime code.

Fixes: 094dc1619cb0 ("wifi: mac80211: factor out part of ieee80211_calc_expected_tx_airtime")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- New.

 net/mac80211/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 55bc451d4a9d..d3b911fb711a 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -843,7 +843,7 @@ u32 ieee80211_calc_expected_tx_airtime(struct ieee80211_hw *hw,
 		u32 duration;
 
 		duration = ieee80211_rate_expected_tx_airtime(hw, tx_rate, ri,
-							      band, true, len);
+							      band, ampdu, len);
 		duration /= 1024;
 
 		return max_t(u32, duration, 4);
-- 
2.53.0

