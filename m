Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501977;
	b=kWLr9dcW5sU7pxRuTshjNxD+YQ4f67vSmDHlXQkfh3/8GBSuBZAWPXB7mDfhAIl2XZgb
	 LG5bKrQKPNK+iztC+uyiraaYGxB3R5KY/86qkyq4FGHrMYsG36gRhbe/YOGwg9KZTiabc
	 UkdFH131uh+/XwPPvaKOeKGtwAL3R5UB6PJMS7Z/owE1ezWubB1TuWB2Vm8BzWkd68Hk9
	 VRnieuphyHaPH88fjHwkZle6gtpYk+a65rtFh7OqosJnj6hFs54T02pi9JgwbpSdxinFo
	 e7utlngU6f9T9jcFX53O5g9c4ooJ31nMYl1LbfXTrIxuNeaEw7+lWVJ2ANCbEb1OU1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vjquRUStcAkxhtcMG98uyTm8S+FU38EvYx9GS3qKCBo=;
	b=EsxSQh/sawJ5NBlSpPcaP82hp4RbgJac2lY5rOmT1AiNy++wd4+17dGjUhSRNFK7e2gY
	 YyC1ZlyhgW4lLnwnowXLbRXSxl7+i7JOPAJmsOYc459Etd9pz6vw0cLbSBhdHyxGbfl3q
	 uu27YGAjdZ2GQJAeJlMNGPuOCYw2vPKH9x2yacgJL8CTNShkE0NHZM8dO0MDbj7yQNAQg
	 tcw8biuGGFg/sXu9zEVDQfCANrIxDhrcfKBDqZgcyr3zB3Ys82yoDZ70DC5yMmMH4mWT4
	 vHfcmQyd0IIfxRkNhUAACRP3b1aVp88WeBGTSwCUWpD2d/C93JtsKI0iAOWD7480xnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHJGo6Ft;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A171606A8A4
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A171606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHJGo6Ft
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso8021652c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501976; x=1795106776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjquRUStcAkxhtcMG98uyTm8S+FU38EvYx9GS3qKCBo=;
        b=vHJGo6FtygGgQvmAC+B6SrUGtWT9A6nHzMZjN966gxygIC2z9CFUZR7gDyjuni3EjG
         GPMUhtn0d4LvE0zR4M63N3KXcwnAYFmQQV3wS0UM51F4+hJ9k8llxzsmJYFo6cVCAx10
         Lc5FZzRdlU136uvCWrA78/K3ZK3furCPMVkTimO0qBehA3/hfmXG0cZ8BU5cHWFpd4va
         ZJAlRnE36bsW4++NAKBD8/LybgefewN5VxgaogjrUba5S7hfTrINRCuY4/dBSm9BUOD8
         PF8CesdNVbastLFuxvi+wMd2+GU+qKTQxZ+yb3KqtVsJeQn9nITlBXk76nY16AEipR6v
         jJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501976; x=1795106776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjquRUStcAkxhtcMG98uyTm8S+FU38EvYx9GS3qKCBo=;
        b=UHJoAwJTjyq2tp2UCjZ333mHIGL732PjsqMW/RkZnWW96I8vGQyMxqH1E4AC97q/h8
         b3NMhMT/S1+nJ+dmE16t6isnub5we2Goi91xqZYjFH6pn5f9Q/TJlkHU6n+KOg8WeX7N
         dRdKb4KGLcfZRjSuqtefNbCjGt5p43078QwOcIobi02IPXDEq6NcJLzFFWJ2QqtNpweM
         u+E5wc3kNu6aonqjtcTa+e282fx7YEMinqc0LyMVrTGRaYmgI9RJ5VE5Qz33emn5xtEo
         SaPypeHvCJVjMx1k3cCVZfiK2FDvBtEUv16P6n/UWfmH5iR90xov9LdRlRIoRB6tSQHj
         oGJw==
X-Gm-Message-State: APuU4Z9dVhRhOnuKpfriupsscHqDRDgJJEobQiT76YzMs4HtryFG/GCj
	kMb1Dch5yUFVOX4a7BIiNJ4FiBqaFPOqNYtFZdYlFxcjHXfM+CjNtUgk
X-Gm-Gg: AYBFou2uXloYNPY9fXLdo4Zlq+t6bK5MLTcn4NfNJL1h3XB298P+elVaRNqzVO7EkoM
	e6Iz9Lp5gAv9ffcVJBUtMB68noRvLkilxlHQTM5Mqgtszn5oQiDSAF/peqykJXQPDUwjooO3P/k
	Q//Pf8DKixSmu/ObMEsv9fwKPl52RqjTfVwuMEsFEDm7QA172aWfPlZtSByBVAS3enlNX+YbiNg
	n+6Ic6aGsKygGfxwEENu7T8sAgz02n9xxQO8/+5ygSXp/NGghbuUSaYEqJiDdc3WZwRz84thrAT
	mmprgpYO98legc3aqyp+2/XpnJvqPe69Bd20ru2xkxQvLkC1suohMSvNfMJo9z2+v8N/49pbRu7
	tyPeie4m2F55DdqSeTL5Vmc4lBXTEAtmf5Cj0tikmfUR7fXhSuPr19PdqNgncE4pxvhH2/H9AOx
	0bG0Xz4h57wjyd2RBioTDfF8m4/J6nucKSPNbKRMR6M0kLOfLI1AsrsJ+NchIeAeEU0eh51v6OT
	/qfsl3Nfo7Jai0nEqLJpL9D1s+E0RvzT9oFo5E/Gm7tfkKTFC0Aa+63SdsBP/8TcJV1idYMqV1z
	LsmkrddK5ttB2lDkK7MA4bwAOd9av8Fu0EGupbUhMWYtqTZwSKlFXvpKX66x+V0AxdkZgN9ZwoZ
	scdv2iZwUf7CFfP00gMMJzDoZI5gHV5dgyz3iu9jzpJXi
X-Received: by 2002:a05:7022:3c01:b0:1b2:48db:23dd with SMTP id a92af1059eb24-1b50314c097mr94688c88.16.1794501976193;
        Thu, 12 Nov 2026 08:46:16 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:15 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 3/7] wifi: rt2800: make MCS 16 fall back to MCS 8 on devices with 3 TX chains
Date: Fri, 13 Nov 2026 00:45:37 +0800
Message-ID: <20261112164544.3176458-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

MCS 15 has worse reliability than MCS 16, since 16 and above
are 3 stream rates, and 15 is the top of the 2 stream rates.
Falling back from MCS 16 to MCS 15 does not make sense, so
make the fallback to MCS 8 on all devices with 3 TX chains,
like the Ralink driver does.

The retry chain is now MCS 16 to MCS 8, skipping 7 MCS rates
in between. Reflect that in the retry calculation code. This
also fixes the retry count on RT3883, which already used this
fallback.

Test results:
   before after
TX 28.2   29.1
RX 70.4   70.2

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 10 +++++++++-
 drivers/net/wireless/ralink/rt2x00/rt2x00.h    |  5 +++++
 drivers/net/wireless/ralink/rt2x00/rt2x00dev.c | 14 ++++++++++++--
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index 371b293bac..3be4f4cbde 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -1096,6 +1096,14 @@ void rt2800_txdone_entry(struct queue_entry *entry, u32 status, __le32 *txwi,
 		 */
 		__set_bit(TXDONE_SUCCESS, &txdesc.flags);
 		txdesc.retry = ((mcs > real_mcs) ? mcs - real_mcs : 0);
+
+		/*
+		 * On devices with 3 TX chains MCS16 falls back to MCS8, so a
+		 * frame that was sent below MCS16 after a three stream rate
+		 * skipped MCS9 to MCS15.
+		 */
+		if (rt2x00_is_3t(rt2x00dev) && mcs >= 16 && real_mcs <= 8)
+			txdesc.retry -= 7;
 	} else {
 		/*
 		 * Transmission failed. The number of retries is
@@ -6280,7 +6288,7 @@ static int rt2800_init_registers(struct rt2x00_dev *rt2x00dev)
 	reg = rt2x00_rt(rt2x00dev, RT5592) ? 0x00000082 : 0x00000002;
 	rt2800_register_write(rt2x00dev, TXOP_HLDR_ET, reg);
 
-	if (rt2x00_rt(rt2x00dev, RT3883)) {
+	if (rt2x00_is_3t(rt2x00dev)) {
 		rt2800_register_write(rt2x00dev, TX_FBK_CFG_3S_0, 0x12111008);
 		rt2800_register_write(rt2x00dev, TX_FBK_CFG_3S_1, 0x16151413);
 	}
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index 415ff253cb..ace06ba73d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -1200,6 +1200,11 @@ static inline bool rt2x00_is_soc(struct rt2x00_dev *rt2x00dev)
 	return rt2x00_intf(rt2x00dev, RT2X00_CHIP_INTF_SOC);
 }
 
+static inline bool rt2x00_is_3t(struct rt2x00_dev *rt2x00dev)
+{
+	return rt2x00dev->default_ant.tx_chain_num == 3;
+}
+
 /* Helpers for capability flags */
 
 static inline bool
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index 7b23da0678..7c03fd07bc 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -329,10 +329,10 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 	 * lowest rate was used.
 	 */
 	for (i = 0; i < retry_rates && i < IEEE80211_TX_MAX_RATES; i++) {
-		tx_info->status.rates[i].idx = rate_idx - i;
+		tx_info->status.rates[i].idx = rate_idx;
 		tx_info->status.rates[i].flags = rate_flags;
 
-		if (rate_idx - i == 0) {
+		if (rate_idx == 0) {
 			/*
 			 * The lowest rate (index 0) was used until the
 			 * number of max retries was reached.
@@ -340,8 +340,18 @@ static void rt2x00lib_fill_tx_status(struct rt2x00_dev *rt2x00dev,
 			tx_info->status.rates[i].count = retry_rates - i;
 			i++;
 			break;
+		} else if (rate_idx == 16) {
+			/*
+			 * TX_FBK_CFG_3S_0 makes MCS16 fall back to MCS8 on
+			 * devices with 3 TX chains, the decrement below shifts
+			 * it back to 8.
+			 */
+			if (rt2x00_is_3t(rt2x00dev) &&
+			    (rate_flags & IEEE80211_TX_RC_MCS))
+				rate_idx = 9;
 		}
 		tx_info->status.rates[i].count = 1;
+		rate_idx--;
 	}
 	if (i < (IEEE80211_TX_MAX_RATES - 1))
 		tx_info->status.rates[i].idx = -1; /* terminate */
-- 
2.53.0

