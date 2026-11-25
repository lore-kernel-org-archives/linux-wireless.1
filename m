Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795574158;
	b=ARAGojaktYxTYSx7UMrg23d5A5JVVjaaclkIUiwFgZSjuxwJxJ2BRRo652LykOs11ZXm
	 DkJ16jiIUlPIIYTLZDovMv5x/I1gTS8YrQCtUggZIxasoR8V8ffgHq/aAwpcFlE7eOgXl
	 U4SAAWpYPz/J+j2DZI+WNGyhXo4i6CB+7eiqhTnAMhi4W5lKJmM6gFiznN7hkxkmrjVok
	 kBEM7XuVhrk5w44NwbWue5CbsxPJ8UHWwafLHNm1RHf9jfioQB5j80iZCAHZ7AdbsT+3B
	 Q11cIDdjWta7VoYMh3XIdwAXqSJ6ESGPygHcPXe36zIH2KTpVaq+TASO7j1YCstafqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795574158;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kkjotWNit6WeB7BL8ny+BSpa1LvJy0BiQUhKGewgf40=;
	b=q1yjVpGzXH4O2IaNzhG89r4H76aUvyCl2moeyCMlI/ZmmqhfF/wJMi+zqtgmrUOjsVJp
	 9vKUjyypyYNXcVsINnaiP6IchYG2ySaWJCykfG+Nn3meNbfKs2ApksGwgISoewWmXy5TC
	 YHy7N7ng9ylIS/qaF4aM0CQ29Wm3v6i1bzzWYzr5gimbElyjN9AiCLOTUY3cBvWCakIdq
	 6xDW65oL7aBFK5lGZwC1a3qUXgFoAgwtPJqkYw915EK+8vE+I684HWzvlY/H/NxnClpzw
	 eqUihK7xkt1FSHDpTwqOvu5pt7QSAUEvmeHHdiwVJONUdBstV1zldEg5vPLaV3k440Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGKx8odQ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEBD606A321
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 02:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEBD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bGKx8odQ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so1664080a91.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 18:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795574157; x=1796178957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kkjotWNit6WeB7BL8ny+BSpa1LvJy0BiQUhKGewgf40=;
        b=bGKx8odQn3izS95lNxJ/R94uws4UJ7u7Th10wYL3zT18RJ+PvW/l/Z+FpVAeWrMi7I
         HcocfVZoszw1AL3AxOYP2iCov/KWQyuU/di64LKuc7B/esyhnzyfMQ2y/OlesB6sXBJ6
         1lyrdXdLUFcp+JvmdneNTMO4as/Lpdgtu7Dvtw/H4KUJ6FP/hwTdKODC1AOt60TLfOEv
         wvEJsyFaaSV2XEHFWlwF2He31CMZ4DKPMeSMXPvvG6XFdmg1V889hX/JAwZpkaUTVE35
         Xx79AM8WBXIRQ+/soMo9pKKsBydqTqw2M7AOXTSQI49RbonCTY4ugfkV/PG8gL0dUDB4
         0W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795574157; x=1796178957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkjotWNit6WeB7BL8ny+BSpa1LvJy0BiQUhKGewgf40=;
        b=udVOhi3Mu13g1zGzUt3m37eZYadix4/wS7O37Qtj5v65QOi3eucGNYRFJznUBDoVOg
         thQkqtm43T2rrLCKO5EJk6FL39BCoy0Qm22go95E4VsKsJClIiDTTIc/kCoM91USPosZ
         sZcghrPMxRF6blVa6Y94EurzkQQ04h4cR4hQkKDY30VLkR+Z6QSwcUXNqOeFblOuvpox
         erwBKMBtG+n+WAvJiRrQvddLClYJkqtc2RGt/cbUO5zB07Dy4nIphaO5FuCN90mKrqCw
         tahqj49wB0AUIYegQNNjMT0XIxwrnwr2egsVt5V/M1vk3YZDXeY8Qt5lAOPAy658/VEH
         Et6w==
X-Gm-Message-State: APuU4Z9I3dnEpaCr6WGcIvGyWkBvByIIwCuVNpyA1+Cx7yGh7m0L0WfL
	fJrPF5aybwPAo8ULe3awyNPPRnx2XGxFRkB4UmcMNtsoBDicPgJqolUOHgeBow==
X-Gm-Gg: AZFdTZd3+Hx0tt/6W49nEE99Ku1oOomCNcq/vkGJCB8jDx5ScyNcCW7vv+D+jmKgrco
	i93aYcDGVQCyogfabG8nJyhtK/zCQLAjgYgbIxeWcbkefJo6Tt1nyi2vZ0LSbSKu9Sb99xPOgwa
	2HUBXfIBbKxAsUZgOY7mQKSfxJQq1MC8617nv9KxlrQ8bP52jQN0RnQIh4ULgqOxfM6BUsC2Oz5
	IAIxQSBU1BG9qRwAnYNuh3EARBXjf5tZwR0/XZQN56/Qy6F3XaHCOAs21W9+9iSzGMKxAmOPBmY
	zxRRcNkTa9j5bGz8TbO7rHQxWlw1onx+a0IxO/IHG7hvP4TcI6t34Ic2sy+1bzfzQ7IHMy8h9y1
	vHapPuysNTQM2FWig3kqeub2vNst3t0vf7qJJrquJY5dc+yWJW9tichG6xwVjFatxv5YmWC/c5z
	5iJB1puBITHWCSAntujDdfC5qKgTa3VFTm4tr5czUjlVuN9E4Tlm3nz3Is7n1F0QSWHbbWUysA1
	43Wrt1pDwCnlbvoKAyUmm+tB1e66vwbhiBd4OQRhSrPNrmjqDPgY3swyPV5aY1G5OvYHhMl2wXv
	bJZJWytZ6Gq0XMrxOoMCoG0MUSb47GGFOa/r7YJ+uan75Z35/z3/qkTrRXu8Ae+E2p9tTcJvPnr
	jJ4mrbaDGVG0qDyLdW+DUAJPkz7lZvvYD4jI/Pehy1SmraOGU6++EIgT8WaiV7zlqhZvfRuElW6
	oeSg==
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr16314232a91.52.1795574157390;
        Tue, 24 Nov 2026 18:35:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm26165439a91.1.2026.11.24.18.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:35:56 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Jouni Malinen <jouni.malinen@atheros.com>,
	"John W. Linville" <linville@tuxdriver.com>
Subject: [PATCH] wifi: ath: clear the keymap bits of default key slots on delete
Date: Tue, 24 Nov 2026 18:35:54 -0800
Message-ID: <20261125023554.2342281-1-rosenp@gmail.com>
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

In station mode a hardware group key is installed in the key cache slot
matching its key index (1-3). ath_key_delete() returns early for slots
below IEEE80211_WEP_NKID, so their keymap bits are never cleared and
stay set after the key is gone.

ath9k_cmn_rx_skb_postprocess() marks a protected frame without a
hardware key match as RX_FLAG_DECRYPTED when the keymap bit of the key
ID in its IV is set. After any earlier network with a hardware group
key, a later network whose group key is done in software (GCMP,
GCMP-256, CCMP-256) then has all group-addressed data frames handed to
mac80211 as already decrypted. They are dropped, so the station never
answers ARP requests or other broadcasts from the AP side while
unicast keeps working.

The early return dates from when ath_init() marked slots 0-3 as
permanently in use. That was removed, but the early return was kept, so
the bits of these slots now stay set once a key has used them. Before
mac80211 gained software GCMP, GCMP-256 and CCMP-256, a later group key
normally went back into the same hardware slot, which hid the problem.

Seen on an AR9550 (Archer C7 v2, OpenWrt 25.12.6, backports 6.18.55) as
a station: wpa2-gcmp works on a freshly loaded driver, fails with 100%
loss of AP-originated pings after one wpa2-ccmp association and
recovers only after a module reload. With this change the sequence
GCMP, CCMP, GCMP, CCMP/TKIP-group, CCMP-256, CCMP with GTK rekeys,
GCMP-256 with BIP-GMAC-256 passes.

The slots below IEEE80211_WEP_NKID are never handed out by
ath_reserve_key_cache_slot(), so clearing their bits cannot free them
for another key.

Fixes: be2864cfff2f ("ath9k: Fixed RX decryption status reporting")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/key.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/key.c b/drivers/net/wireless/ath/key.c
index 0ae436bd9b66..0df26af987b7 100644
--- a/drivers/net/wireless/ath/key.c
+++ b/drivers/net/wireless/ath/key.c
@@ -593,8 +593,6 @@ void ath_key_delete(struct ath_common *common, u8 hw_key_idx)
 		ath_hw_keysetmac(common, hw_key_idx, NULL);
 	else
 		ath_hw_keyreset(common, hw_key_idx);
-	if (hw_key_idx < IEEE80211_WEP_NKID)
-		return;
 
 	clear_bit(hw_key_idx, common->keymap);
 	clear_bit(hw_key_idx, common->ccmp_keymap);
-- 
2.56.1

