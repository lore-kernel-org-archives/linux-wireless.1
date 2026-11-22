Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327175;
	b=zu4kC/TWLmDsM5pzbm4qwZiYmM0FHeVxL39rsscJJwrbpu9ooo1RlIn8nEXq+G8dQfGT
	 gcTwoFDdmXqfMaETz02+5oFcWrOfVDiE0kTAF5yGdUkr9J4i9Nx1vPdIjcwW7ZWAaYOsn
	 s1HeTFHV66Pi4GSEtj3PI+VBVx8HqvQV7PoALJjsj5XT8N+BXuY6TRhBveU4T+fnv6N8n
	 yGyIZimvBdrpdrCoF4IY0KM+VbtaGoKpT61cWSpMKX8MocK9rSdqVeZ2rFPMNMC6mLbn4
	 scKSlD73hNJlW0J1nL2X4sJGwlANmEJx5xSXQIy4WG6UPNM51oEaalb7thr8QlozPsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TGb0t7uhjegmL+1vya2CqcVgPoY516z+kpFY4pzhlxs=;
	b=hcStwE0SA+PCK/fq3mz8Wo/1WuFBZn0/3qL6dTaZuKBYzv7wJ1aC6YGaw3SPzNtOa3rf
	 Lk/nS+VUHL6BI/rqOtO0MXrF3rv0ltGHbM0PD1LPQFwp8dH1y0REfOzGafdzp1+bx/it+
	 HBg7HOK+tf8NnedlAv8em1tGWItnbRV3BUutXoLa0OmUitbF2san+ShTCqEmAT+F1DfPw
	 Tb3kfAf6tOmkjxOrUrHVyKQHkKDqAg7z9fxOwPSeSES4sMNEob+Dqc8j/GaHTabj8Mquv
	 91oT3QqyirSnMIXpnsUoSwF8KmOyCAz3rCp4zJofCMNM39BY1qLrjudGa6g2hJ/PPIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZmJlnpb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D7606A320;
	Sun, 22 Nov 2026 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UZmJlnpb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327174;
	b=lrc3z6t2cCTejjm1t88/3D4wRfupBYpzYWq55zX3Bm2rMiFwf1ySNtWFo9p2VUV0cOsG
	 DQIBMCs1eDh4UolRf/bqrr9RAr91m5UH5mx2yoA2iAbiDaWgcoRzJ4qkv3XyCSIDKuI4v
	 JrxRK65f+Bkqg6fsXf8MvrrKUfRXiAVCSlWYPfkuedXuDFQKqNC5OMXSjFE6sfsR3e8oq
	 5XOap9N5TPe87p5nkQmwmIEgntpoRRAMKBu9eJCOxNX+SSNlP3DrGPwsZUfPX79anKEqE
	 7mOtlCXtAuFRjckS84IN6XBAYYmLDM1My4LUMBolIK6rRf3kcYew7FIKKDUezhBMoJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327174;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TGb0t7uhjegmL+1vya2CqcVgPoY516z+kpFY4pzhlxs=;
	b=0rhV1t6RGl9XorRKkXdONBdjPoQYCr9ata1jQrJgm+1gqtzkhYntkP/sMlSDrM6fGrDr
	 66sTuIZSC97lId/fqOzzOgZOg/2J9oW4p9uxsHRLZnSdCKkfdz83Srz/M01oJIz8KgSAV
	 SiD+kckQ73LCMwYqtmtNt47I8WbHrGTlFB2E7/SVOG1gE4RpuXyOaW8ZL60XNwiOUDVI5
	 IDZhd2AHooJGnsVOgKzcNlldQDc+FD9fbX1LSiRrMSfc+bXsXhXT8F2hfEie3pzv9dfVB
	 VGs47yR4af79iry4VlXqaeSMN4d4VO1+MVle4aTelSU43yzJPXw67wJKZ23Pjr+dEPQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12E601F000CA;
	Sun, 22 Nov 2026 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327174;
	bh=TGb0t7uhjegmL+1vya2CqcVgPoY516z+kpFY4pzhlxs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UZmJlnpbfpqecH4Y/Rffk4tmO0INflix+JEA9WzI1yEYFZegjkNeDiuXIfnVamvq/
	 b7nIQ2mRfyxmdQ2SCck4k0fBlG79bvBVaYPJYNM6OVV3xA4Icq9Loo8zT6hru2Kbgc
	 1BnOk0wmP11WrEMNRIAh032Nz514oq80hXpYKMYS6D7V9QFXNIUoP4t3Hl4LVWc/ku
	 ckMsr9l4Y4s3b0udTDMAri8Yx4G6QX0Fz9J/qzZ1UQlZd6RRWPJFNNW6WZPL50LmXG
	 lVz1lzX/jSgFgyYr0HXgvaa0q4o64SAjr2KKXjH47VEewZ+jmiZmuG34to9iifO4Mg
	 kjWKMDzUeeYgw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8E1634BF64;
	Sun, 22 Nov 2026 05:59:33 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Sun, 22 Nov 2026 08:59:29 +0300
Subject: [PATCH rtw-next v2 1/3] wifi: rtl8xxxu: honour the rate of
 injected frames on gen1 chips
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-inject-v2-1-0ee720fe706d@proton.me>
References: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
In-Reply-To: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327172; l=2442;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=Wvp0OW65ZO2LjZAdzh7EPWwrcNCqXAiWrUKUm4WVJ7c=;
 b=aJ9AaEBmLy03Z5FA5knGiIhGK7AqK+hAYAS1OhlKE5XDAOwO4MAApNfd5x6w/lV8X6Ax9VXYh
 NrIs95X9yrlCsQS0i5YJ3UPgb5TFphVUQn/YNYuXk4MH5DhEaTgOJeo
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

When a frame is injected with a rate in its radiotap header, the driver
ignores it and leaves the choice to the firmware rate adaptation. On a
RTL8192CU every injected frame went out at MCS 7, whatever was asked.

Use the injected rate and guard interval, and disable rate fallback so
the frame is sent at exactly that rate.

Tested on RTL8192CU (0bda:8178) in monitor mode on 2.4 GHz: 1, 5.5, 6
and 54 Mbps, MCS 0/7/8/15 with long and short GI were all received at
the requested rate. Frames without a radiotap rate are unchanged.

Reviewed-by: Ping-Ke Shih <pkshih@realtek.com>
Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 604bb1e5b05..3b77a7ce884 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5223,6 +5223,24 @@ static void rtl8xxxu_dump_action(struct device *dev,
 	}
 }
 
+static bool rtl8xxxu_tx_rate_inject(struct ieee80211_tx_info *tx_info,
+				    u32 *rate, bool *sgi)
+{
+	struct ieee80211_tx_rate *txrate = &tx_info->control.rates[0];
+
+	if (!(tx_info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT))
+		return false;
+
+	if (txrate->flags & IEEE80211_TX_RC_MCS)
+		*rate = DESC_RATE_MCS0 + txrate->idx;
+	else
+		*rate = rtl8xxxu_legacy_ratetable[txrate->idx].hw_value;
+
+	*sgi = txrate->flags & IEEE80211_TX_RC_SHORT_GI;
+
+	return true;
+}
+
 /*
  * Fill in v1 (gen1) specific TX descriptor bits.
  * This format is used on 8188cu/8192cu/8723au
@@ -5240,6 +5258,9 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate = 0;
 	u16 seq_number;
+	bool inject;
+
+	inject = rtl8xxxu_tx_rate_inject(tx_info, &rate, &sgi);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_TX)
 		dev_info(dev, "%s: TX rate: %d, pkt size %u\n",
@@ -5285,6 +5306,10 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	if (sgi)
 		tx_desc->txdw5 |= cpu_to_le32(TXDESC32_SHORT_GI);
 
+	if (inject)
+		tx_desc->txdw4 |= cpu_to_le32(TXDESC32_USE_DRIVER_RATE |
+					      TXDESC_DISABLE_DATA_FB);
+
 	/*
 	 * rts_rate is zero if RTS/CTS or CTS to SELF are not enabled
 	 */

-- 
2.56.1


