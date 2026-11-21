Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278995;
	b=Q998D9bBV+sEyrN8IKycIT2gA0WvqZc23QkRK8gcIcl6MOYynjB3tLxfVl/GtfqRIyS6
	 YBDHZzRHs5G0MdhAiubMUiEiCEclOB01mqVzJTt26x39jiWJXw4+iNeR1Uu06w9Zflgie
	 ogN3To7IRDkazba934d8nqjPLFlAisTgtFX2NUGPpxQwZFuEncWjIatP0R/5m1JmU60KA
	 kJN64dY1fuNGbTxDlLMKsg0eUbQR1ezrTzt7WYieceZhUnDAEJO6jXbcHmZT9EMF4gTDH
	 tT0EzS/+CYnXAGwxxbLHKwoEEt1u1bPy7cJnV2Qnx5wqDTa91/uQOhmKoKuJl0GLZoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7DeVTuQrYsASnJ+ymnmCnAG2Ji9/l6ci1SThhWZ6G6s=;
	b=jX8VOqFDSg8knITWqiIoBpCy4O9S9Cxcd4J3wV9a33sEkUKTEPaO/hk76E6hT3R61jR9
	 q1ntYtBCdSsEWUHni6kaAc5L6gaD7PeJGCiw0UjOXQBJ6LfwmifF7tpmK7Tjb7JXPETxi
	 FhO+vLQZBe5/RQt8JQed5z0PjmslGf6krPcnzZ8fP3TuSfNekT7SVySYxyAmzjRP/zR/9
	 uMn2m+Z0Jo5hu8Sd27kBe1aKcsUqCGW4uVVNwATiyep0mNhUt1Gej/CrJOzecVkhOIT7J
	 IB5XVwdgowtS8j9ga0ou8XifZV7EXh9g0315wwgEIpGLXiokSNgSkBFgR9vNxaJ8T/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEwVr+HS;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70DF606A335
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 16:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A70DF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEwVr+HS
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso1320967a91.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278994; x=1795883794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DeVTuQrYsASnJ+ymnmCnAG2Ji9/l6ci1SThhWZ6G6s=;
        b=dEwVr+HSExkMLBvHFfNA74Q/D0EPIuEXkbx7gYIS+Lv21hLambcZQucOVyr+NOdvec
         DcGyLvEPSAus6Vkdbehg9v+we0k1gWzdUTm3mq/MIZSjprEhxtzKsB14yL0ZPJ2W+U/c
         19J8NSZG033JpeCkTkNd/7CsKJZM0uQXNupgw0lHpIK2/6+ktW8N7jp2T2A4ynHwwvuS
         WQ3WdRIz48hbv5MxB2DpmzA/aj1k1TXbRGMM8yZaY0gEFGGVIszQHgpBdJ9XQknhzCb8
         sTIY0sfkYGN90gwXLXwFkNBFd7Z4Pn3U2g60sxBpeLGMbRFfVdhWgJ/vbMnJ4BnQ6tHR
         5OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278994; x=1795883794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7DeVTuQrYsASnJ+ymnmCnAG2Ji9/l6ci1SThhWZ6G6s=;
        b=v992ZvdJI9TlA+cpHR7SeLLJFOIGGqZYsjL1vdc+V3VTXBXi5K1kAb8r9lfgL9nYS/
         ZYaP03r6nWeRSHCNVMrylL580CgjdlCBGkM3MQ8j+LAtJN8MyTNoTzdwHM2qOdgGGzRQ
         PeS9jv68Rvkb+L/XaQ+0yIBUhMC+Jg+4pqtLEUGPtFqWRxXqe1x9eCV64s5K55ku5ipJ
         sAsSKWqCfcR3Z8Ix9KGc2uGcOE5I10geB2psoWorAtsunTAwBSshK+QyfJwRPk8jx8Tt
         OSzafKjtdijJbVJ3SRSMgBqqKJg8p/NJIPw5T3n0WY/OuFIkQy0GdkgCjvlISiPigKQp
         0cpg==
X-Forwarded-Encrypted: i=1; AL+hErFbY7+02B/7ugC46ZdHoT1FqYwc/tIO0SKhRvi7pAE5DTQh8Siu8vQ3ie1rmLWPVRMtYE7c7zsDzAr4nCYTDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/LJqAqDzbqjCkeipDlchoB7wTtNrzSNxxc8+wje/H3XlGqj4p1
	HARievyoNggV5rslgZLKSr5VqsJiBCHj8uEgbEID9mk4tuwulEKnkr+p
X-Gm-Gg: AZFdTZclR6yt8bsaxa3OlgVI9LhQ4lU5pGdgCcc5BS7aVWjft03JEPB5+brjfTA9R3f
	TG0zkLnKOYXzDIcVZ8Ku2nEzbeqERUjxBWDC5zv22zXMhoJ3vDnnIXYwMgVSgcxwCW9AR3q4Dno
	MEKaJHx1+38mI1S2mP5xVVATZx+/6acHHqLqbZIVQy8/1OhKyCGqT+1XZ3c6Go1ZwD9NUAPc9yQ
	tSiUs0ptGBW4pXzWIZpd4vbjtKBnSfLX5n0ze9zCgggywTL4zG2Hub8nYX60oPNEnC3KPAYk1Yv
	vXUZXZW3a+ZNYEwazRcm5WWk/kjagcLk5xK5393Rs+YkES795BQuv4JT7PcYcoHYz9kM+wROnj3
	8OCXurHQpjqOtwQHolhCIq3oqa/wvq/EMejpZNk7bIX3PBanMDB//vwiLyT8uqC47yFrEqgGagp
	zbBnOdnC5DNmLfngGV1A/mgiJYDh5SAerr1cs1PfOP2eK8STakD+xAtEEW6POoQ9emCOAJuOwWB
	a9WAI33VQC/BRJmtz/w1EwkffUBc8P8wUSCJnk0X8RgXuKI3S9aXtBa9NzgCSSXAeO1JFdQdlN5
	KpvXkQkH7XOmt5+rMuQBoGlDVa3y2Dq2suZe9/K+Bf0F5aaZ/RkYaF144H0ipcMlVaokB8THcOA
	jRMue
X-Received: by 2002:a17:90a:e705:b0:3a0:9640:803a with SMTP id 98e67ed59e1d1-3b41c7e118emr6541664a91.5.1795278993908;
        Sat, 21 Nov 2026 08:36:33 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:33 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH rtw-next 2/3] wifi: rtlwifi: rtl8192se: don't mark unencrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:46 +0800
Message-ID: <20261121163547.37019-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121163547.37019-1-enderaoelyther@gmail.com>
References: <20261121163547.37019-1-enderaoelyther@gmail.com>
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

The receive descriptor's SWDEC bit is set when a frame still needs
software decryption. It is also clear for a frame that was never
encrypted. rtl92se_rx_query_desc() nevertheless sets RX_FLAG_DECRYPTED
for every frame with SWDEC clear except a protected robust management
frame, including unprotected data and management frames.

mac80211 then accepts an unprotected unicast data frame although a
pairwise key is installed, because ieee80211_drop_unencrypted() passes
frames marked as decrypted, and it accepts unprotected deauthentication
and disassociation frames on a connection that uses management frame
protection. A station in radio range can therefore inject plaintext
data into an encrypted connection, or end a protected one, by spoofing
the peer's address.

Set the flag only for a protected frame that is not a robust management
frame, as the rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and rtl8821ae
drivers do. rtw88 dropped the same assumption in commit 0649ff58a0f6
("rtw88: Don't set RX_FLAG_DECRYPTED if packet has no encryption").

Found by code review. Compile-tested with W=1.

Fixes: 84f494cef7d9 ("rtlwifi: rtl8192se: Merge TX and RX routines")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

834fc28d7880 (7.4-rc1) fixed "managment" in the comment this patch removes;
with the old spelling in the removed lines it applies to 5.10.y through 7.3.y.

AI assistance was used.

 .../net/wireless/realtek/rtlwifi/rtl8192se/trx.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
index b057d035a3a8..663f7a5fc070 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192se/trx.c
@@ -274,22 +274,16 @@ bool rtl92se_rx_query_desc(struct ieee80211_hw *hw, struct rtl_stats *stats,
 
 	rx_status->flag |= RX_FLAG_MACTIME_START;
 
-	/* hw will set stats->decrypted true, if it finds the
-	 * frame is open data frame or mgmt frame,
-	 * hw will not decrypt robust management frame
-	 * for IEEE80211w but still set stats->decrypted
-	 * true, so here we should set it back to undecrypted
-	 * for IEEE80211w frame, and mac80211 sw will help
-	 * to decrypt it */
+	/* SWDEC is clear for plaintext too; mac80211 decrypts robust mgmt */
 	if (stats->decrypted) {
 		hdr = (struct ieee80211_hdr *)(skb->data +
 		       stats->rx_drvinfo_size + stats->rx_bufshift);
 
-		if ((_ieee80211_is_robust_mgmt_frame(hdr)) &&
-			(ieee80211_has_protected(hdr->frame_control)))
-			rx_status->flag &= ~RX_FLAG_DECRYPTED;
-		else
+		if (ieee80211_has_protected(hdr->frame_control) &&
+		    !_ieee80211_is_robust_mgmt_frame(hdr))
 			rx_status->flag |= RX_FLAG_DECRYPTED;
+		else
+			rx_status->flag &= ~RX_FLAG_DECRYPTED;
 	}
 
 	rx_status->rate_idx = rtlwifi_rate_mapping(hw, stats->is_ht,
-- 
2.56.1

