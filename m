Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026908;
	b=eTGKzfjze2XE83sJMmo459Kd+R1GzyGW2VyY/kdClpuVPcD6qJbC6Z+eEyhNUH1ctN+X
	 BDrnaK4pWXGCKcM/ARu8loq0+JwiUGpVM1kkylT5iwPrs2RQQV7q22oBV9RBOssFvxxM9
	 wGt8Ci7d6NMYIuBsnsQR7vC+jLuhIVYPjBW1U7R3yEmzjrYoFeCG7wCPa7q7rq8IdNzYC
	 l5O7N/nIxMIysKUM3TjiUKHhPqv3GJwvd08Mdb1AZnyJLvnh/kZUsWrQS3lsXhvvdFq8c
	 F6aBfBPR0dQwc6jpJp7fuLpOJW2eTtnP+owLkTkDZwQTi9fMF/VXMltKWIS+vMjQ9HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
	b=DZgcIscgy6AxrFGUQm7YTusw/bzn9VA6fIwRK5lIMeRE4yA3XKYWY9pvZMgv5AQUzRel
	 m5Q4PpCkZ/eXR8gcFr1CqplbxyQpP0bIEU2E9t/IDMgMZ/gD7W0UFOacsHfYSVOjOA8Uz
	 Ug1hvmmxD538DINCS86KEKyZj7+PI8D4uF2sYlEK7lKTiLcWyqDFSWCnvt8zAzEfSGAAo
	 7SFq/cDqUYLEjKVzApgSPZzi+b+3lSYHIr+TdIVjkSsR2CPwFRA9EdKt6w2Ld0Gp+Kk4n
	 xyLvOcgVlw1L8hxz5OYbc5WCWXLnK/Ebt9ZRgFzyZ2CwTgLOG2llozNR2R2TDa0DaZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXU7IlvU;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BC3606A320
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 18:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22BC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WXU7IlvU
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-382ecd5cf2cso121399eec.1
        for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 10:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026906; x=1795631706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=WXU7IlvUoaBDmdG0YdpGKD0oXbWF6EMQnA+H1DRw7s6gz7dnXmc4kP2voAooCKo5do
         X/NNmx8k0ulmLW+xXDicvQquBqw+3AFEetSr7GO9kOJLEE+qK6QjgOrfgpnc2pFZ4OcA
         RsQoyhvSWJVNBYEdWmvYI0SSc944SbEDtI5x4K4rw/TslaKjQjucCABoNhTehwt1FZtr
         NmwgYZellNLKIozbGeXe6yog5yPBFhw8RUqjL2oQ+q3ZlQjHS/xvXZDjDIWt5hV/8gNL
         qd4E3BJ90OevoLD/G8g0Ft1P++4IkgKFzgmOTUmxnJTsG548izhEd0dapgJ0y5kWTZNH
         9PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026906; x=1795631706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1mE2/uvxHDBhyh7b8T/IYHmltMNQ44dSYQaeZ69JlY=;
        b=r4f35lGmugqWiaOI18VmkrsuP6OPYhxGbYgNEcZUvucXR9YyG9+Kg2tEZTKWl6mbpq
         zMtE5hViuQ2mF5/4diH91UDYy2+R9yRu/0FyBMYA0mj2fSbpyQ9LGuD83StuGTAoaS43
         44+VE5vKKj/rO8ATAFiRpRhFfgSnn6wdMlMXKBiiarm0yQWmYEeREYxqASeGfdDPYPN9
         WhXHQXSw8PD95rqtJaQUtyY0FD1rK1LxivDmS6kisx/bjZsDJc88WOMsI9k34PZR3N+J
         neN7+Fr4VJ8DEt/qXpqXTC10IJVfg56752zKQRdWtXJUV2E4MEe657qe7ry3K8Eq/UeI
         0wDQ==
X-Forwarded-Encrypted: i=1; AL+hErE0la+AKrmg1zrvtSIH/SqYNWORP5eEXydoV91i7vpGn67VaDas6hG/01hDaRPjgLl9pJyD6zuK1TnxA1fdYw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/0H+tMKsmxqLlFgkC6GR7Nor80yx4560FUOqtZXhOtQliMADVp
	4P83qUGNEq1NwZeFtNaXr0iiXxMci0w8waE3W7m/v+7ulWaZdbJrfZlf
X-Gm-Gg: AZFdTZdbo8o6jjSTfurOXnYn2PuCWHIhMr9Vr8j6WyVKt6zcanIPujZsXZPsr/LieTP
	86VvlzPJpJqd8/KvV7tlwuA6X4eWCYO7pSO9a0GJOpx6jn5xszLU1QKO1IJYf6eTvmJRmj5ErH0
	730uDbrIzA+z61vfnH743Yk02a9JzCxrkuXHbcaAj716xA5u93vmxWuw9Y9LKKXqSwZkxdFVbxB
	o27Az1OHXs2LcMNyDjCv24KZOpjGoppYeW6tOEtR0zV8EvRXv6WX9/8G0xbEWqxP4QqUvQSdB52
	fRXSt/lMzRF2yzpFNP89hRNw4GVKFXbluUNMqeyTrKCZejMFlsFNQYZFMMLcEbdA6D/rMRKknHo
	ycNO0Q6avdlAY2xpORAWHeDG0qNfOc6y87uaa9nAhcZfKa3QS5GHOdSmf0QvkpcA4DFa/VSdn99
	al1N+d15B8BpCMEnLx2dqHxTZpzfUQxoT9NAq5qCbZiOwy/UgKC+1PA9eUK75NS+bgpqSezCAv9
	vQinzUZ/Fwmk107W0CiQb+2L/k3fiWDIowZjTnup4ukWzzMsgR22qQYMWir0egepbVhTx5//ijQ
	6AUpj0W1dqaN9u/XqAh2Kz0KmD4seYDjyA3kRF/3mWiwfk1oIfzyZOqni4uYASAMPczBAnpgB5k
	r+AkE
X-Received: by 2002:a05:7300:ae97:b0:382:2ae3:b1d0 with SMTP id 5a478bee46e88-383ee2228b7mr240375eec.13.1795026905715;
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm9453348eec.19.2026.11.18.10.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 10:35:05 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7996: restore the wcid flags on reassociation
Date: Thu, 19 Nov 2026 02:34:38 +0800
Message-ID: <20261118183438.44794-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
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

On disassociation, mt7996_mac_sta_links_event() clears wcid.sta and
sets wcid.sta_disabled. Nothing has cleared wcid.sta_disabled on
reassociation since commit 13e2e9c6b348 ("wifi: mt76: mt7996: use
mac80211 .sta_state op") started setting it. The ASSOC event used to set
wcid.sta again only after the rate control commands, and no longer sets
it at all, so wcid_to_sta() returns NULL for a reassociated station, and
both mt7996_mcu_add_rate_ctrl() and mt7996_mcu_add_rate_ctrl_fixed()
dereference it.

Set wcid.sta and clear wcid.sta_disabled at the start of the ASSOC
event, as for a first association.

Fixes: 13e2e9c6b348 ("wifi: mt76: mt7996: use mac80211 .sta_state op")
Fixes: 28d519d0d493 ("wifi: mt76: Move RCU section in mt7996_mcu_add_rate_ctrl_fixed()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in a QEMU guest with KASAN and a test hook
that reassociates a station through mt7996_sta_state() on a synthetic
device whose firmware commands are captured: without this change the
second association hit a NULL pointer dereference in
mt7996_mcu_add_rate_ctrl(), with it the association completed.

No new W=1, sparse or smatch warnings.

AI assistance was used.

 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 9321c8146e2a..77f0664fe57c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1491,6 +1491,10 @@ mt7996_mac_sta_links_event(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 
 		switch (ev) {
 		case MT76_STA_EVENT_ASSOC:
+			/* Restore the station state that DISASSOC cleared */
+			msta_link->wcid.sta = 1;
+			msta_link->wcid.sta_disabled = 0;
+
 			err = mt7996_mcu_add_sta(dev, link_conf, link_sta,
 						 link, msta_link,
 						 CONN_STATE_CONNECT, true);

base-commit: 763b13f622e2758726e8e3ecaef819db8fa0430a
-- 
2.56.1

