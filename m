Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371140;
	b=rjePNr1kuepw+NAjGPHbpQcr530f4cGdntaqK1hO9hQpp66ttey1nlZ22+IQ1vzO5JjU
	 gE/SElUCl76ujlWe1u73Ud6mmyK40DSgxSmbn/YFQhPIHAnbUJ7Yx9m5ITugBxCX9dEN0
	 2KVkpyks9PRnFynSr8ijzoqKebn8cCjfAdYK/f9I8DsrGTL4+c/Nl4Omtw0VoiNqG8CSq
	 oNPP+bdUdDoArapveMMcP3hNO5i2JaJq9083lWXWuQKT30dTqxQukeW35OkEMxI8XZOJO
	 bO/W+KMRmbvUQeiDHwk0jA7B6Zuudf04WCG9gcyiL7Ng1m4NWGXO23BcLAVzaqT+nsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
	b=z6T1dpn3v6a8Mk0Umr/1vQ2cJxa5hg/KFrwrIObnfmBkqHzJf+vTLYVHeXlbU1KmBnWM
	 O5uXZpjTZ8wJwsuTrfnWg8ofkwafUxTZMcqMh1UUckl1rTDYJJ1wPZ4yIkAsj5y+vCagx
	 SefYGCSIG5qtbEp+9EjXRaUHCGgw6GVLNBkPuT2IPFBTZPRPmSIYmAK5yg3xoXYJtukIp
	 DUnmgsc4lM8AyMPSQvY6xVSEFQqvA/7vHugSP3AoeJofi0X6AwsWVsBzc/8AzTV9+CBL9
	 UVtvOblHt3SUqxo55s0MhfIHcsCvyuyF3nipKHdVXBx0wOvLHGrWx4Vq2I7aHv5uHGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="yJC7eV/R";
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAAB606A335
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 18:12:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AAAB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=yJC7eV/R
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so3051962a12.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 10:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371139; x=1795975939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
        b=yJC7eV/RcrD0X62aZ6misJv5IOVhVL3maz0KjDgU7SMO9Qn6WDPmdNNJNh0QmoVKBs
         8OkeSW7aYMCWUwED+IUQxU+nJEwbT/A0KPLyEeq8opTBOai/s9Jo02ReAgi1wZyJyB6F
         MZxKT+ut5wrndXzBRbon5WyPjBVjaQsBS23vWiPCitMeNh2JYteqtNW67qbiUfGMX4eq
         7MMOYyEINdi9FQFZ1Q9JSdCvhs6mKJ31q7ow6cpP1zyHpvf3AC96P1cQKX3TEEEjYYeL
         pSWqsiCFvsgWXO+GgE/irM0zCLko5Y/O7LIZFblbyx1Rb8OqUaDJ2ekTeDkYANa3jUBx
         pEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371139; x=1795975939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwHV/L47aIX6I1PhoJ/2X4nEmV7D+cw1ick7Wr6dTv4=;
        b=tSoLEpZQN108rCd3LJa4tiUS+92DxBeh3yOwm00eXCrD6vQ2VM4XUeUUYYAs2Uws40
         mnkShGtFJkobUTeNuysyCiEQ7081c1J/R7Zm5rBnTvMJMXHLhwJJLTUW/ktW66Bprraq
         YfwWRbuQmMW8U1uw8Djqj/+JM0hjmf0JytvcyZ1KplA9KMl21I1paLSoJLwKa31sPHzf
         Ql162sRqPpp0I+OAU+kXLmLER+HWhPGSH49VBFw2Wj10kfJR4P8g6xmoAsQsWeU8Y6r8
         ZR1PzsFMFco5LBsb/jaijhehghfMefKdpgNA77jdn/LTzlhe6tueH/hZq1MyawZ1cgq1
         Y07w==
X-Forwarded-Encrypted: i=1; AL+hErGTvKg+DCRhWBN9ncNB/polS2KKOZ3LI/cB0Eum9RNFLtLaau0BZ5EFES6uYUWrxPYBxtgN838fsQAdJAyS9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+h8yTaBz86RuzsBvLBPs8Hfm6Ls89v/QRcvVYMQ5+Bh7tnvqrb
	SW7dZP2o6hpw4F7fbIlwD/nEd1/wy2V7dRDaaQy5PskOtMLKIghYz+ISgHw7mqSa0Q==
X-Gm-Gg: AZFdTZdJesmPpjZMQMD6V5ScstEQjDU+xb/VkjeWZ46EpHO7ecp6BCxfIk2VmHeeDFh
	tjLwMoaqptis1zBQrPfBEaXXCskMZ3cpWdv23KXbMjQBtBLCxiXBwBfTvpqXEvshQ1qHhHSqBHj
	PlJ8W/XpbHY2kYoQjJ8ZtrqdCAUPwlwignTRIV0c0W5diZ2hoT7bQq2cT7RRyCRr8/soe5K6A14
	WLKvg+VwyC1lEYc3UDJk/DOGzZbi6BHkrsB8N0cUm4zOopDN7avIW+ocYGX4NaHI/fqROQzYJZt
	YYXD28+oY1Y/RIYzOO8dYTrlrthUeqNVNTwGFz/WBtHAVEyILAq7nQ6RJF2emanzPxhU3InLS1w
	4lFM6Gh0Hi0/nc/+m0TZbcICoaB0b0/mOH/zXJcuOr3Igy+e598SgxlbnslYed/pLMDCedNzpG7
	iJr9wniGMUyaOdRxq8EaGIWTxmZmocZPe/WqLbZL0sJ1946vj9P1Ld+b8RCPjtJeDOFKe3a+2bb
	cvYZtNL907l0O3LFIEFe1gq7XX5jA2dK0dw0x1jnD7Wyx5pV2gBHbUs5uq1hjSWXKuxDwK5kSHD
	f8ZXucX57IazgcDTpaQy7nR8rUdXKjThbLh5x4HFj2xtmYKmVy6Xbgff1X+X5Fjf4heST55Rdcp
	Drlp6jjtB+G54+H1nUftCvwCgF4ru6NtsqwgLlnPtY9RAB0KoHtmV5626hP+k95lpKtG6hqAxTF
	Nv+JFMiYPlzH0k+8XoGe0W2pGdURBK6kEThGAWZIYaNopHzj2S6f1CT1kHmBN++6c32xI+uLb/C
	IH+oT6AKwA4EVYC2pgEPs7reJkmUw6toCfawLYOPnnAY5wc1UMYMTeX7VGBLKSts3n8xlHC1cPr
	u/JsixspYzXWi7VutHIW9VrcFJUV8zr+emUeFU8oK/dCwQLDmm6jZT7nHiEzjdxObNuJWvuH
X-Received: by 2002:a05:6402:569a:b0:6b7:5712:b6c1 with SMTP id 4fb4d7f45d1cf-6ba37ac6db2mr4318502a12.0.1795371138807;
        Sun, 22 Nov 2026 10:12:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cc257sm4052567a12.13.2026.11.22.10.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:12:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>
Subject: [PATCH ath-next 3/9] wifi: ath11k: push TXQs from BH work
Date: Sun, 22 Nov 2026 19:12:07 +0100
Message-ID: <20261122181213.1016590-4-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122181213.1016590-1-julius@bairaktaris.de>
References: <20261122181213.1016590-1-julius@bairaktaris.de>
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

Each frame that the network stack queues from a receive poll wakes its
TXQ on its own, and the wake ran a scheduling round at once, so a round
handed the hardware a single frame and paid for the ring access, the
locks and the scheduler per frame. Record the woken access categories
and run their rounds from BH work, which runs after the poll and takes
every frame it queued in one round.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/core.h |  3 +++
 drivers/net/wireless/ath/ath11k/mac.c  | 24 +++++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index 8b7bfb0cefcf..74fbff296b60 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -715,6 +715,9 @@ struct ath11k {
 	spinlock_t txq_lock[IEEE80211_NUM_ACS];
 	/* access categories whose round ended for lack of room */
 	unsigned long txq_starved;
+	/* access categories woken since txq_work last ran */
+	unsigned long txq_woken;
+	struct work_struct txq_work;
 
 	struct list_head arvifs;
 	/* should never be NULL; needed for regular htt rx */
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 090df2f1cadf..0af4f2fe27bb 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6791,6 +6791,7 @@ static void ath11k_mac_op_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->channel_update_work);
 	cancel_work_sync(&ar->regd_update_work);
 	cancel_work_sync(&ar->ab->update_11d_work);
+	cancel_work_sync(&ar->txq_work);
 
 	if (ar->state_11d == ATH11K_11D_PREPARING) {
 		ar->state_11d = ATH11K_11D_IDLE;
@@ -10211,10 +10212,30 @@ static void ath11k_mac_schedule_txq(struct ath11k *ar, u8 ac)
 	spin_unlock_bh(&ar->txq_lock[ac]);
 }
 
+/*
+ * A frame queued from a receive poll wakes its TXQ on its own, so pushing
+ * from the wake would hand the hardware one frame per round. The rounds run
+ * from BH work instead, after the poll, and take every frame it queued.
+ */
+static void ath11k_mac_txq_work(struct work_struct *work)
+{
+	struct ath11k *ar = container_of(work, struct ath11k, txq_work);
+	unsigned long woken = xchg(&ar->txq_woken, 0);
+	u8 ac;
+
+	rcu_read_lock();
+	for_each_set_bit(ac, &woken, IEEE80211_NUM_ACS)
+		ath11k_mac_schedule_txq(ar, ac);
+	rcu_read_unlock();
+}
+
 static void ath11k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 					struct ieee80211_txq *txq)
 {
-	ath11k_mac_schedule_txq(hw->priv, txq->ac);
+	struct ath11k *ar = hw->priv;
+
+	set_bit(txq->ac, &ar->txq_woken);
+	queue_work(system_bh_wq, &ar->txq_work);
 }
 
 void ath11k_mac_tx_push_pending(struct ath11k *ar, u8 ac)
@@ -10953,6 +10974,7 @@ int ath11k_mac_allocate(struct ath11k_base *ab)
 
 		for (j = 0; j < IEEE80211_NUM_ACS; j++)
 			spin_lock_init(&ar->txq_lock[j]);
+		INIT_WORK(&ar->txq_work, ath11k_mac_txq_work);
 		INIT_LIST_HEAD(&ar->arvifs);
 		INIT_LIST_HEAD(&ar->ppdu_stats_info);
 		mutex_init(&ar->conf_mutex);
-- 
2.53.0

