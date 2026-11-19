Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126171;
	b=MMswapub0tupZ8W+41/iNdNvQCtUrt3x7efNoWts5wOpS7phYR4Jn3Qu1+NKwdu7HQnf
	 hXWrAFZGSiJAEoX97wX2E1tOOYy4ypND4Uz2NR7E0qJZj+Jv4yikhmFZGS4FrMvdEsxF+
	 lw4NPLsYTuMLeG0X+vmmaXV20PLRHzASnTULcZPWcLAB52Wx8QXnzBwHMbEfEIaQ3hEOO
	 9L4bhi6LLGR5lbNuhFWGOfJpQ5h+i+LHZlGn46PzkH/r0JChLlIhrqeV0SzC9kQsp3Pff
	 Kmlyc6iN8lm4o6nq/Dwsvy+PbXp5EHdAx/agtgINg8kQA6frD1CK0e9PKpn8x5ckJtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cp8fEAaHHxvJaoEzDdBPLUOzoam5V3CvCOYn2tJdlyU=;
	b=Ux3qYggpPL4qdzqM2u4ayx4u76BUc0aJTC5G/7lg8dd/Ml+9gPm0Nclrskc/7OT20wHl
	 6eTAISMBAsSOWSeQ1kEaLNP7AOmriC2JFEi8jKj9OnwKQlS7CleY1XzsQhmgcQ7gdX5by
	 fjjvEv5cBk627ROhDbFdpvLAWwrVArLJKywPndC/rQzhiJqYHVSXAsXVIYH6oxuR8RpJr
	 yvBsPOyBmOXy0uvxcIHWvORpL2oxMUqHA6mBLeB1O19FyStX024ST/gwN9fTJjn0t/vfv
	 NaKNizogjNsd3GiYDR557tLR3b3fqPRsPMB63SojrjCYSmQ7m7vOEFu0PvlHqrIOr4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="NHnP/ayW";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6DB606A333;
	Thu, 19 Nov 2026 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NHnP/ayW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126171;
	b=3J32lGzyeXT2nEEDIdDVmPgwrsfNoWwSKSC4XeG8QMr7Lyua/VPJRqS3zkHdyIstZ5WN
	 3O9V1u347sTc3oqMlR4x5b7tDEXjh1ixnaiIuzVum7p7lbrK0/KKuF9TNNv1vKVYTHVjv
	 PKD1qxhcsp0iGogyioiSGRjtAl7LgfclTwsnpHnUBmgpmr+hHC5QqrGP1/l2qm1fTX+yO
	 xRiiJ2lXFHmlH9j5ZBTvfmhfMNyTckImVRgbL2vlEqBn7726xobJv+q4STRDflAF01ic7
	 nWj6i8+SW1HVQwiEZT9Ke/WUwQlIZtn7T1Rz9kenwKkp8ws0hmfNnsH/BwQEYGlmIKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126171;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cp8fEAaHHxvJaoEzDdBPLUOzoam5V3CvCOYn2tJdlyU=;
	b=j6Qz1hV9EeI0n0EBppLNlEBM9D49hv7Mb25AvKVC+VfHFyZ8LTdHCpq3hx+gk44Iy27N
	 KUI4eOjKZYW+GD7U08ytAzH9fUtK4Brocs6lOJs62hJWF2gog2iVciFCsB+lV4q18OaJo
	 zBmMcIKcxiYzuEMOEfllpLQw7hgpNMoLa6NN5Jeoj8yxjIHJo4qRt37+Ueh2+/kIquPl+
	 3BYm8mo7bdDOUgIXat3rnowGrr//14NCDzdZp7aKcNjiaBbsRCmzW85FuERmQ2/o0xMCT
	 hR8I3SBl/5AUGg2f1jxGkH/Ti0l7YM+x+AdYf/bA/TYsGHpqmPiTZRHHqqjcLeWNstg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E1EB1F000C6;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126171;
	bh=cp8fEAaHHxvJaoEzDdBPLUOzoam5V3CvCOYn2tJdlyU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NHnP/ayW8peJySMpChFbDOxLbX/gZkZ5Pbyv/MhwQbqFS9Baw2mRsIe4/weoXooAm
	 HrtVwRNfUAcBw+txVYlRRMkDmjuvuRMd6VPw2jrvgjhU9gBoG6msNSAi/b/ml4mDfB
	 L7/MQhiHq8yAdlTLQsSDSFcc2Y828gfENpjRX4XWIkqHsyYXhOfM/R2by1TIpIK5kk
	 mIEeh1KLWYysl9ZXtqEAZwTWaRQmwTljXXDZ1hjklBY4XUUGPhvGLKW/YL3HQWo1c8
	 Innlg66AfDf3UBb5L42dwXb0fYQ627vWCIAoZe68S7XxWznDMDXUe2v2pZTNc+lw0I
	 h1OQ4ogVuT0YQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0920B40A01;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 20 Nov 2026 01:09:28 +0300
Subject: [PATCH rtw-next 1/3] wifi: rtl8xxxu: honour the rate of injected
 frames on gen1 chips
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
Message-Id: <20261120-b4-inject-v1-1-1e1693af0c6b@proton.me>
References: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
In-Reply-To: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126169; l=2543;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=29W25p5uamZL66BmTAE8xfDsBvBCRxEXCMdXGOu9KFc=;
 b=85a6xrx2qldGLsd2Xt272vl8LqgEdHvG2dkH90+GlY4qTQGJWJb1V/4j9JxljZnoQTv2OXvQw
 Jo7WLq8yGlmBIvimNfIlQxEtXnB4TaPYXJHwyo584NiiWSgm6bLzLv0
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

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 604bb1e5b0..969875fd54 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5223,6 +5223,28 @@ static void rtl8xxxu_dump_action(struct device *dev,
 	}
 }
 
+/*
+ * Use the rate from the radiotap header of an injected frame, if any.
+ * mac80211 has already checked it against what we advertise.
+ */
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
@@ -5240,6 +5262,9 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate = 0;
 	u16 seq_number;
+	bool inject;
+
+	inject = rtl8xxxu_tx_rate_inject(tx_info, &rate, &sgi);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_TX)
 		dev_info(dev, "%s: TX rate: %d, pkt size %u\n",
@@ -5285,6 +5310,10 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
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


