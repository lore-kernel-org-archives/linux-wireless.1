Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991929;
	b=ua/fnd287AmTVzdKHgHWrmUWUYTt2HO47ctjqqLd85BPPzJ/lYDwU5iDqEgr8UMGKrd3
	 6i9b2abiqQIcas3w9t4UsESgKdi3NMp6Hqd1KI39b6mk+0GISgnSRiPUg3SXndPpQKEEK
	 p8fqt9yfAGnaXKKxF4Q0J4Uc2cQUCbl4/5njm2x9hPqZ22hcsCrEoTnGbFT2v3fLk8ODn
	 vv6Sdhm+yPPLIbPzilXWMDrlOlkmqYDb1yA3jgvLfWW8xcDN6TmgRnYzggmVt1xmZr0qj
	 23Ad55uUwE4C+4ThTHk/69LWW6z5rURbwAsY7VSeOxs6N0gMmaL7200tcL6OclHZqWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TzG6CB5mbUjL4i1wwOtQqcjpwm9NDorO8ya/2ZN5BSk=;
	b=fLTZIdSABxPfta5awP84QWJ5eBmmR3QN0vDI75YsseCr18yGzkXZfkqrUZ3zlEKT4Rrr
	 gxAujh0a+vK7R+nwAA2Gt5mpX4FAvxHtIfkie/Td4s/gqxMBM3ebcrri9rqSKOQYADhwu
	 frwoQY8pjoR2LLxNEQmNjGAAInBb/I3cJ0QSLG0XWtetY4lcOHiC5N83R88XZxhmwFgIf
	 0nPgM0HaW0YusGrA+FEeLMN7uubVt055ry2MWnEe8znwdOYxAuEWVV/0lj6wFBBGFtzqI
	 3A93O41mFk0JCOYEyWIZ5CXFx78i7u+glCf/HLqSkBZayR5Q+OoXs3niP+pC+ItMcqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JFMwgP8I;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58E4606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:52:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JFMwgP8I
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so5354165e9.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 00:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991927; x=1795596727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzG6CB5mbUjL4i1wwOtQqcjpwm9NDorO8ya/2ZN5BSk=;
        b=JFMwgP8I3SBwcTIPLThzf+iPr/z6yVuItYnGncHMENVrHIde2NLOwFiqujUbsO25ZB
         KWn8Q/aPwf1BGiWhDjhIHyIEiBi1ZD42BFUFLOXLPVxPjXwhXIgbovfoKnGlhSRLKgtZ
         q1CLaIeV1p9Mv4ZKsCcKsOIr1SHgsvlLBroJ5b772BTRu4teF7WkLkOWp9IXTMyPrgI6
         TPjbfrtZcKd2+7QNmZkcWTNbVKPQGv9/ZCjG8kceDoWmzJLKbxoh9GDdaTQe2iWQLPxw
         mfWRkrYTSHXbZggWWjYHJ65KFy0E33eE5lTjm0wWzyhb27YlDO4y8M1zREVIPB3QONhR
         BhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991927; x=1795596727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzG6CB5mbUjL4i1wwOtQqcjpwm9NDorO8ya/2ZN5BSk=;
        b=GZAZswrGesgQhFYx7UvBBI6tnORzmM99KcUOyx9k/kD9HB8JYRFPXBj8gu4A41LYJ1
         9zKEFlWVFb866EM8Nmqs0id8hdISCUEtQ6Kv1N7af5PUfe3EvoJRAME5lg6TOsDMI2qu
         qS9KF/G4ZH3u3RtShfADacW5YhEl6MyWheeIuo5pswCxQZEnVSpm2nJ6CzBoH3V+DvKM
         4z/XmpzO7YAW+L8EGWOoD08k01doN2sSBIEcSTDb2yYvJO3j0eY9CtO6WAwNuVy2B/yJ
         nEjWSuWXtDlr8avs+U4oEoywslMuqd4mG0JI2oQbA2rtyG+z7mcCgtjSQ1XLLss5wtYq
         fnyQ==
X-Forwarded-Encrypted: i=1; AL+hErG92IXz6PrKhaL53eQ0Ph4/mNI7ijKSKCC3+vS1RChV/1hRHXLMmliAaJqgrmE7B/R74j9rxnL/yEeaZxrnMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+P5Xv3/Chpb+n0hNEqsGP1k5/RvEZtZMKbF/7Nd6WAgsBvs8fu
	rRCxREFebibsDEAfpZ5zV/gkDvjIpsnC7UgyMxJlxDCdb6SsqrStFyFjeBNJ3Ns8
X-Gm-Gg: AYBFou1a+M7tVz9Pz4DXPB18zeeqejH7BJbOtnWb+71+kNZ1zfEYStfQXostoQJvW8M
	6QLhdlwPXlULK+sOO7WZcXcqV92oojKSBjfDaCecKvmCSNz1rSS7K3Mr6BGFQhhLu9y5UR5POv0
	XtrH9dwqd5hlJEdl7946efCi+mpVG+jMbgpQGcHK09oZt8msrmeVUeAVjoyJuxAQAvS/uk+g57b
	ob44x0hY+N7kLkMZlnPq33LS/RIfdc/esyIMrs3oLB3nrg0kT/XTYffGfLYOGAr0ppBabo9yr6r
	Py0v+NITQl8myykcPiF/tN7NGL01VBoQtEG1kMafkT6aF47Y+H1+CXimCvYIJ8A7lYRlJ4tv4T8
	R3oMF5rVPlrlC1mArB1ELkTAYztdsXVntfEZxVAOzmLOxR9vycbVtTIY6uHo490jnTcviB0wu1n
	Cjq+6khw0+RV9fiFyeTM/QpPNacCYGrwn+u5wMQT7bx0AeJLxtIEDgebeWYWMA2Kq5d8IIVP7CH
	rfwT8ZXge2ijiELa4FWx3Ny9agGSXn4HhgJh9INDhZAW1SJr96S/xb2/R+yDDYeZyyn1y3DxxpI
	dRPNhjBTisbPETHtW6+9MU5rHRM7AY3bFPo=
X-Received: by 2002:a05:600c:8b05:b0:4a3:12fb:1ef1 with SMTP id 5b1f17b1804b1-4bb7da26eacmr32193455e9.29.1794991927122;
        Wed, 18 Nov 2026 00:52:07 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm234525265e9.3.2026.11.18.00.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:52:06 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: "John W . Linville" <linville@tuxdriver.com>,
	Sujith Manoharan <Sujith.Manoharan@atheros.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH ath-next] wifi: ath9k_htc: free an unsent frame with ieee80211_free_txskb()
Date: Wed, 18 Nov 2026 09:52:05 +0100
Message-ID: <20261118085205.1989547-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

When ath9k_htc_tx() cannot send a frame, for example because the USB
send fails or no TX slot is free, it frees the frame with
dev_kfree_skb_any(). mac80211 keeps a copy of a frame whose TX status
was asked for, such as an authentication response of hostapd, until
the driver reports that frame. Freed this way, the frame is never
reported: the sender gets no TX status, and mac80211 holds the copy
until the device is unregistered, where it warns:

  Have pending ack frames!
  WARNING: net/mac80211/main.c:1761 at ieee80211_free_ack_frame+0x4c/0x70 [mac80211]

Free the frame with ieee80211_free_txskb(), which reports it as not
acknowledged.

Fixes: fb9987d0f748 ("ath9k_htc: Support for AR9271 chipset.")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Tested on an i.MX8MP board with an AR9271 as AP (hostapd), ath9k_htc of
    this base. A test hook in htc_issue_send() fails the send of the first
    two frames with a TX status request while a station joins, after the
    driver headers are pushed; both are authentication responses. Without
    the patch no TX status event is reported for them (iw event) and the
    unload of the driver warns as above. With it both are reported as not
    acknowledged and the unload does not warn, 2 of 2 runs each. The
    station joins in both cases.
    
    This applies on top of "wifi: ath9k_htc: count a frame as queued before
    it is sent" v2, both change the end of ath9k_htc_tx():
    https://lore.kernel.org/r/20261117071620.1650281-1-mehmet.fide@gmail.com/

 drivers/net/wireless/ath/ath9k/htc_drv_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/htc_drv_main.c b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
index 3c52e66c79f4..7f85e980fc81 100644
--- a/drivers/net/wireless/ath/ath9k/htc_drv_main.c
+++ b/drivers/net/wireless/ath/ath9k/htc_drv_main.c
@@ -902,7 +902,7 @@ static void ath9k_htc_tx(struct ieee80211_hw *hw,
 	__ath9k_htc_check_wake_queues(priv, true);
 	ath9k_htc_tx_clear_slot(priv, slot);
 fail_tx:
-	dev_kfree_skb_any(skb);
+	ieee80211_free_txskb(hw, skb);
 }
 
 static int ath9k_htc_start(struct ieee80211_hw *hw)

base-commit: 465fcc982a221f774594aa7d7351fde8c03a3deb
prerequisite-patch-id: 9b2187facf209488bb53b815bff10f3731764adc
-- 
2.56.0

