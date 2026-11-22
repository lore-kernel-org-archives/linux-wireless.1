Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795331045;
	b=YONOH4nPEI6AmFvZTOIWEIaTl/cjCmreBpzvUmCp8fCeqCUdR7hThYsr/Ai5LsKWk65v
	 X6g7y3AoKQpa4TLdGxlXHMcWSob16m5jrs4OpzebEW4Lo7/RQ4I5HKQUT+77574ztXGOq
	 xD/QPgq+7FWrhvbXr5oSAnw7xJZTK6E7aSbYHXiBMZPrlr0u1YriFURtNaPIV5z99/v2y
	 Pu38sSGvD4Rqer62s9lfXyDProPrSGHpWbdYrs0MHfKcF7YUb7ZeuvZOP4YbNaDC/vNRh
	 izBEjBLdCmurW8fi7t3MGqOfEygAcVXhfiGAZquVvJduyZ35Qg2dpDtU79Bq/7cT86w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Nfxpr+xvHBYS96AE31oj/ATLceXgGgUOhq7pzqdcoI=;
	b=wf3fRU9ArO4/uylB19zL+X+8IYi3TvZkQdZ7ziD2HPiH2sY8YD3JslCkcRjXciKwpfpy
	 54OqBdmlApM6j7orUGekqvwsixsTkO5HLPmlGdsSZocfT690+n5C6ePwVLAFiMuuPvNIp
	 LaTkA5jTICz09D5QaiJPNUSbFj+QjlKHDIvYDmwC08fDZ7UEz5Koqz/Iew92jiacR2tez
	 bzN/cX1JV0OHLLZaiJSPTSLYdFizlJ6XOTVzsF/Rh/6LxLiAp+rxvw3eL1DsLQIJBOIE5
	 fXnEeXH35PVOloaMFCqdPlU7NbRPboCo8QMCDKaO7fsLg0TKeCviEKxwLZIeYtVNTuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tf60kPJ5;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABCC606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABCC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tf60kPJ5
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1259817b3a.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331044; x=1795935844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Nfxpr+xvHBYS96AE31oj/ATLceXgGgUOhq7pzqdcoI=;
        b=tf60kPJ5PZ9guVcyIRt9usGOczeHORo461nktZ+77UVIbzk5DMCqBEgMnGcVRukUMw
         PwHjLizJ+QF3xuxuB/EQl7omu/ADcUGvNQCkWr8jNbYdxmNZu7ksrjnlytAycgAp82Ai
         5kRE4JcpeFYloYXB5poXr9F/4NCgQezrBIPJBHOENohBXuYaGROe2yyyHWBLH3OiLF7X
         K9YipSltw5B5KVaza1Sd7ccxvMOOPhwLe47DUtgfwncSCPZ8gdyJJE3i0R/4ERdRCw5m
         RdMW7D15LcV2Zg3xaH2uGnAzrauGxAJXw2nZaIYKboJdftspIbZ9CFVlgVPQmHLF6lMK
         SlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331044; x=1795935844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Nfxpr+xvHBYS96AE31oj/ATLceXgGgUOhq7pzqdcoI=;
        b=ZkfEP/h/4Kv4I31F3SE95WzY4GdoENDnAKYhiWi2pg9JYmYAKqQUF9f2sqzF6TyKPO
         OXf8t65zBvO1lD0vr87eBZy2ULYgEno16UdxQimpinXqy0Nkwv4R6jwTdZXlSU6+TOpM
         DC35r79jxF/GFFBpZZ/eloA7Sv1/6/1VV+3lZ2wWsgHk5W7J71OlsQlsrnADMIs2qZ90
         uBVBGu4deV6KXXrxJlrd77RKtFlMwyBs6GK7bWSHdexamUb4S8okRhD1oIlBsr1+7cyV
         jMA7AW61ZgOlfSQr2XS+B5Vq+HOUPkpOAee8FumesriTHtmUFLoj166/BmD5npvbJnvl
         X2lw==
X-Gm-Message-State: APuU4Z91XI67UQHBGKvZWEdNWNJJfJqebYle+bYFP7mvpMQjlVS+RzQC
	mzcPnYTujXD7Lo1wKJnR6nfMbRJd8JONqnuhj1+04b79GYt3mj9YS96947LeQw==
X-Gm-Gg: AZFdTZfY4cfLNwVyGvHk0Lg2nnbUQ6HjoaV+nJl4EN5mnRQKChv4DL2XxHXk2Ff0Gvc
	IavaPznvnnv+MsT1FGFwSUHW+mcjaKfEiLheoxyRMMISLcKIRK0mIQMyJpz4RbqpT0jg+kD0tAE
	TyW4x6B//1ujIDo8TyA8FudVHYb42XQLhk4kC3IQnkNQag5YTHFRMU9Sm398DSJC/UlOs4/kgVI
	eaACt9SexlsKPFq1YgCFf0tRM0EJLYgpId06dZBVzh5enEQFVnUZ11zMMSBTrs32mD5mQkaa/zX
	WQFRkHtI6/H5dNKhou6c8bmkhqjkcFXs5yc/xTAnz2af9OBjMsbD3HqXQF7eztelYRASAr30YX4
	6BQfR4ijX5Vu68OEY1cZlW+XC4tYNHkSBlURBDVquui/GV06etBbpsz52Q+Tk4b2F3rDvuTteHz
	eJqWUpPRTk39NQ20zRgFBHqYqwztc8Q6VBgAu0wtvQcHHkl+RTt3AkQuJ5dCJ/zuETQkkM6JsAh
	IlQXXokwPlyyK/FU8WDKvecG7ELRS0jYyn10jRLB5tC/0RRoQgqv5E6t89zFX2Ywac9NrS1GPly
	r1Soy97w0j27k/BgGmz4T5QklUxygoZsUMzKzC0iCRs7hpItYMUFA0RqJy6cy5BuAECSzp/7+m2
	fabgtb0GMDDRQHIjbynjS94wiTpb/c+Cwez3DrtK03WRT51mFvrCIqUazo1dIghg6g8tSXyW6F6
	VMfQkwlucqlR0j0LuEpw==
X-Received: by 2002:a05:6a20:7d9b:b0:3eb:ad13:50fa with SMTP id adf61e73a8af0-4014bc4711dmr7345799637.30.1795331043706;
        Sat, 21 Nov 2026 23:04:03 -0800 (PST)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm3609721b3a.27.2026.11.21.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:04:03 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 1/3] wifi: rt2x00: add a mode that doesn't wait for every TX status
Date: Sat, 21 Nov 2026 23:03:40 -0800
Message-ID: <20261122070342.101054-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261122070342.101054-1-rosenp@gmail.com>
References: <20261122070342.101054-1-rosenp@gmail.com>
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

Drivers with REQUIRE_TXSTATUS_FIFO keep each TX queue entry until the
hardware has reported the TX status of its frame. On USB, reading that
report is a control transfer, so the TX rate is bounded by the rate of
control transfers.

Add REQUIRE_TXSTATUS_SAMPLING for drivers that can tell the hardware
which frames to report. With it, only frames that need their status
wait for it: those mac80211 asked a status for and BARs, which are
tracked on the BAR list. These are counted per queue. All other frames
are marked ENTRY_DATA_NO_TXSTATUS and completed as soon as the DMA is
done, through rt2x00lib_txdone_unreported(), which hands the frame back
to mac80211 without a station so that rate control and the ACK
tracking are not fed made up results.

Some of the other frames, unicast frames to a station that expect an
ACK, still ask the hardware for a report (ENTRY_DATA_TXSTATUS_SAMPLE),
which only feeds rate control through rt2x00lib_txdone_sample(). At
most eight samples are sent until the driver next finds the status
FIFO empty, a sample in an A-MPDU (whose frames may all be reported)
takes all eight, and no samples are sent while a tracked frame is
pending, so the hardware status FIFO is unlikely to overflow and lose
a report that a frame waits for.

As unreported frames come back without a station, a frame that failed
because its station went to power save is no longer filtered and
requeued by mac80211, and such frames would not give back their
airtime if AQL were enabled (rt2x00 doesn't enable it).

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00.h   | 22 +++++
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    | 79 +++++++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00queue.c  | 93 +++++++++++++++++++
 .../net/wireless/ralink/rt2x00/rt2x00queue.h  | 13 +++
 4 files changed, 202 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00.h b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
index babc04210a65..9b2aa86a048b 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00.h
@@ -687,6 +687,7 @@ enum rt2x00_capability_flags {
 	REQUIRE_COPY_IV,
 	REQUIRE_L2PAD,
 	REQUIRE_TXSTATUS_FIFO,
+	REQUIRE_TXSTATUS_SAMPLING,
 	REQUIRE_TASKLET_CONTEXT,
 	REQUIRE_SW_SEQNO,
 	REQUIRE_HT_TX_DESC,
@@ -976,6 +977,13 @@ struct rt2x00_dev {
 	 */
 	DECLARE_KFIFO_PTR(txstatus_fifo, u32);
 
+	/*
+	 * Rate control sample slots taken since the TX status FIFO was
+	 * last seen empty (REQUIRE_TXSTATUS_SAMPLING). A sample sent in an
+	 * A-MPDU takes all of them.
+	 */
+	atomic_t txstatus_samples;
+
 	/*
 	 * Timer to ensure tx status reports are read (rt2800usb).
 	 */
@@ -1403,6 +1411,15 @@ void rt2x00queue_stop_queues(struct rt2x00_dev *rt2x00dev);
  */
 void rt2x00queue_flush_queues(struct rt2x00_dev *rt2x00dev, bool drop);
 
+/**
+ * rt2x00queue_txstatus_tracked - Check for frames waiting for a TX status
+ * @rt2x00dev: Pointer to &struct rt2x00_dev.
+ *
+ * With %REQUIRE_TXSTATUS_SAMPLING, return true if any TX queue holds a
+ * frame that waits for its TX status report.
+ */
+bool rt2x00queue_txstatus_tracked(struct rt2x00_dev *rt2x00dev);
+
 /*
  * Debugfs handlers.
  */
@@ -1442,6 +1459,11 @@ void rt2x00lib_txdone(struct queue_entry *entry,
 void rt2x00lib_txdone_nomatch(struct queue_entry *entry,
 			      struct txdone_entry_desc *txdesc);
 void rt2x00lib_txdone_noinfo(struct queue_entry *entry, u32 status);
+void rt2x00lib_txdone_unreported(struct queue_entry *entry);
+void rt2x00lib_txdone_sample(struct rt2x00_dev *rt2x00dev,
+			     struct ieee80211_sta *sta,
+			     struct skb_frame_desc *skbdesc,
+			     struct txdone_entry_desc *txdesc);
 void rt2x00lib_rxdone(struct queue_entry *entry, gfp_t gfp);
 
 /*
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
index ec1bb61a54b6..14598e67df6a 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00dev.c
@@ -387,6 +387,9 @@ static void rt2x00lib_clear_entry(struct rt2x00_dev *rt2x00dev,
 	/*
 	 * Make this entry available for reuse.
 	 */
+	if (test_bit(ENTRY_DATA_TXSTATUS_ACCT, &entry->flags))
+		atomic_dec(&entry->queue->txstatus_inflight);
+
 	entry->skb = NULL;
 	entry->flags = 0;
 
@@ -457,15 +460,11 @@ void rt2x00lib_txdone_nomatch(struct queue_entry *entry,
 }
 EXPORT_SYMBOL_GPL(rt2x00lib_txdone_nomatch);
 
-void rt2x00lib_txdone(struct queue_entry *entry,
-		      struct txdone_entry_desc *txdesc)
+static void rt2x00lib_txdone_restore_skb(struct queue_entry *entry)
 {
 	struct rt2x00_dev *rt2x00dev = entry->queue->rt2x00dev;
-	struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(entry->skb);
 	struct skb_frame_desc *skbdesc = get_skb_frame_desc(entry->skb);
-	u8 skbdesc_flags = skbdesc->flags;
 	unsigned int header_length;
-	bool success;
 
 	/*
 	 * Unmap the skb.
@@ -507,6 +506,18 @@ void rt2x00lib_txdone(struct queue_entry *entry,
 	 * we are going to overwrite the skb->cb array.
 	 */
 	rt2x00debug_dump_frame(rt2x00dev, DUMP_FRAME_TXDONE, entry);
+}
+
+void rt2x00lib_txdone(struct queue_entry *entry,
+		      struct txdone_entry_desc *txdesc)
+{
+	struct rt2x00_dev *rt2x00dev = entry->queue->rt2x00dev;
+	struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(entry->skb);
+	struct skb_frame_desc *skbdesc = get_skb_frame_desc(entry->skb);
+	u8 skbdesc_flags = skbdesc->flags;
+	bool success;
+
+	rt2x00lib_txdone_restore_skb(entry);
 
 	/*
 	 * Determine if the frame has been successfully transmitted and
@@ -545,6 +556,64 @@ void rt2x00lib_txdone(struct queue_entry *entry,
 }
 EXPORT_SYMBOL_GPL(rt2x00lib_txdone);
 
+/*
+ * Complete a frame for which the hardware was asked not to report a TX
+ * status (see %REQUIRE_TXSTATUS_SAMPLING). Nothing is known about the
+ * transmission, so the frame is given back without a station: mac80211
+ * then frees it without feeding rate control or the ACK tracking.
+ */
+void rt2x00lib_txdone_unreported(struct queue_entry *entry)
+{
+	struct rt2x00_dev *rt2x00dev = entry->queue->rt2x00dev;
+	struct ieee80211_tx_info *tx_info = IEEE80211_SKB_CB(entry->skb);
+	struct skb_frame_desc *skbdesc = get_skb_frame_desc(entry->skb);
+	struct ieee80211_tx_status status = {
+		.skb = entry->skb,
+		.info = tx_info,
+	};
+	u8 skbdesc_flags = skbdesc->flags;
+
+	rt2x00lib_txdone_restore_skb(entry);
+
+	if (!(skbdesc_flags & SKBDESC_NOT_MAC80211)) {
+		memset(&tx_info->status, 0, sizeof(tx_info->status));
+		tx_info->status.rates[0].idx = -1;
+
+		if (rt2x00_has_cap_flag(rt2x00dev, REQUIRE_TASKLET_CONTEXT)) {
+			ieee80211_tx_status_ext(rt2x00dev->hw, &status);
+		} else {
+			local_bh_disable();
+			ieee80211_tx_status_ext(rt2x00dev->hw, &status);
+			local_bh_enable();
+		}
+	} else {
+		dev_kfree_skb_any(entry->skb);
+	}
+
+	rt2x00lib_clear_entry(rt2x00dev, entry);
+}
+EXPORT_SYMBOL_GPL(rt2x00lib_txdone_unreported);
+
+/*
+ * Report a TX status that belongs to no queue entry (any more), only to
+ * update rate control and the station statistics.
+ */
+void rt2x00lib_txdone_sample(struct rt2x00_dev *rt2x00dev,
+			     struct ieee80211_sta *sta,
+			     struct skb_frame_desc *skbdesc,
+			     struct txdone_entry_desc *txdesc)
+{
+	struct ieee80211_tx_info txinfo = {};
+	bool success = test_bit(TXDONE_SUCCESS, &txdesc->flags);
+
+	rt2x00dev->link.qual.tx_success += success;
+	rt2x00dev->link.qual.tx_failed += !success;
+
+	rt2x00lib_fill_tx_status(rt2x00dev, &txinfo, skbdesc, txdesc, success);
+	ieee80211_tx_status_noskb(rt2x00dev->hw, sta, &txinfo);
+}
+EXPORT_SYMBOL_GPL(rt2x00lib_txdone_sample);
+
 void rt2x00lib_txdone_noinfo(struct queue_entry *entry, u32 status)
 {
 	struct txdone_entry_desc txdesc;
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00queue.c b/drivers/net/wireless/ralink/rt2x00/rt2x00queue.c
index 4b842497653c..de3387243b86 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00queue.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00queue.c
@@ -596,6 +596,96 @@ static void rt2x00queue_bar_check(struct queue_entry *entry)
 	spin_unlock_bh(&rt2x00dev->bar_list_lock);
 }
 
+/*
+ * Upper bound of rate control samples sent between two times the
+ * hardware TX status FIFO, which holds 16 reports, is seen empty.
+ */
+#define RT2X00_TXSTATUS_MAX_SAMPLES	8
+
+bool rt2x00queue_txstatus_tracked(struct rt2x00_dev *rt2x00dev)
+{
+	struct data_queue *queue;
+
+	tx_queue_for_each(rt2x00dev, queue) {
+		if (atomic_read(&queue->txstatus_inflight))
+			return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(rt2x00queue_txstatus_tracked);
+
+/*
+ * Take a rate control sample slot. The hardware reports every MPDU of an
+ * A-MPDU with the packet id of the first one, so a sample sent as part of
+ * an A-MPDU can produce as many reports as the aggregate has frames: it
+ * takes all remaining slots.
+ */
+static bool rt2x00queue_txstatus_take_sample(struct rt2x00_dev *rt2x00dev,
+					     bool ampdu)
+{
+	int samples = atomic_read(&rt2x00dev->txstatus_samples);
+
+	do {
+		if (samples >= RT2X00_TXSTATUS_MAX_SAMPLES)
+			return false;
+	} while (!atomic_try_cmpxchg(&rt2x00dev->txstatus_samples, &samples,
+				     ampdu ? RT2X00_TXSTATUS_MAX_SAMPLES :
+					     samples + 1));
+
+	return true;
+}
+
+/*
+ * With REQUIRE_TXSTATUS_SAMPLING only frames that need a TX status
+ * (mac80211 asked for one, or BARs which are tracked on the BAR list)
+ * wait for their report. All other frames are completed as soon as they
+ * are handed to the hardware, so they don't wait for a status report that
+ * is slow to fetch over USB. Some of those still ask the hardware for a
+ * report, which only feeds rate control; they are not sent while a
+ * tracked frame is pending, and only a few are sent until the status
+ * FIFO is seen empty, so the FIFO is unlikely to overflow and lose the
+ * report of a tracked frame.
+ */
+static void rt2x00queue_txstatus_select(struct queue_entry *entry,
+					struct ieee80211_tx_info *tx_info,
+					struct ieee80211_sta *sta)
+{
+	struct data_queue *queue = entry->queue;
+	struct rt2x00_dev *rt2x00dev = queue->rt2x00dev;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)entry->skb->data;
+	bool ampdu;
+
+	if (!rt2x00_has_cap_flag(rt2x00dev, REQUIRE_TXSTATUS_SAMPLING))
+		return;
+
+	if ((tx_info->flags & IEEE80211_TX_CTL_REQ_TX_STATUS) ||
+	    ieee80211_is_back_req(hdr->frame_control)) {
+		atomic_inc(&queue->txstatus_inflight);
+		set_bit(ENTRY_DATA_TXSTATUS_ACCT, &entry->flags);
+		return;
+	}
+
+	set_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags);
+
+	/* Rate control can only use reports of acked unicast frames. */
+	if (!sta || (tx_info->flags & IEEE80211_TX_CTL_NO_ACK) ||
+	    is_multicast_ether_addr(hdr->addr1))
+		return;
+
+	ampdu = tx_info->flags & IEEE80211_TX_CTL_AMPDU;
+	if (!rt2x00queue_txstatus_tracked(rt2x00dev) &&
+	    rt2x00queue_txstatus_take_sample(rt2x00dev, ampdu))
+		set_bit(ENTRY_DATA_TXSTATUS_SAMPLE, &entry->flags);
+}
+
+static void rt2x00queue_txstatus_unselect(struct queue_entry *entry)
+{
+	clear_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags);
+	clear_bit(ENTRY_DATA_TXSTATUS_SAMPLE, &entry->flags);
+	if (test_and_clear_bit(ENTRY_DATA_TXSTATUS_ACCT, &entry->flags))
+		atomic_dec(&entry->queue->txstatus_inflight);
+}
+
 int rt2x00queue_write_tx_frame(struct data_queue *queue, struct sk_buff *skb,
 			       struct ieee80211_sta *sta, bool local)
 {
@@ -681,12 +771,15 @@ int rt2x00queue_write_tx_frame(struct data_queue *queue, struct sk_buff *skb,
 
 	entry->skb = skb;
 
+	rt2x00queue_txstatus_select(entry, tx_info, sta);
+
 	/*
 	 * It could be possible that the queue was corrupted and this
 	 * call failed. Since we always return NETDEV_TX_OK to mac80211,
 	 * this frame will simply be dropped.
 	 */
 	if (unlikely(rt2x00queue_write_tx_data(entry, &txdesc))) {
+		rt2x00queue_txstatus_unselect(entry);
 		clear_bit(ENTRY_OWNER_DEVICE_DATA, &entry->flags);
 		entry->skb = NULL;
 		ret = -EIO;
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h b/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h
index 23739dd0bc9b..99478ae7f57d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00queue.h
@@ -342,6 +342,12 @@ struct txentry_desc {
  * @ENTRY_DATA_STATUS_PENDING: The entry has been send to the device and
  *	returned. It is now waiting for the status reporting before the
  *	entry can be reused again.
+ * @ENTRY_DATA_NO_TXSTATUS: The entry does not wait for a TX status report;
+ *	it is completed as soon as the DMA is done.
+ * @ENTRY_DATA_TXSTATUS_SAMPLE: The hardware reports a TX status for this
+ *	%ENTRY_DATA_NO_TXSTATUS entry, used only to feed rate control.
+ * @ENTRY_DATA_TXSTATUS_ACCT: The entry waits for its TX status report and
+ *	is counted in &data_queue.txstatus_inflight.
  */
 enum queue_entry_flags {
 	ENTRY_BCN_ASSIGNED,
@@ -350,6 +356,9 @@ enum queue_entry_flags {
 	ENTRY_DATA_PENDING,
 	ENTRY_DATA_IO_FAILED,
 	ENTRY_DATA_STATUS_PENDING,
+	ENTRY_DATA_NO_TXSTATUS,
+	ENTRY_DATA_TXSTATUS_SAMPLE,
+	ENTRY_DATA_TXSTATUS_ACCT,
 };
 
 /**
@@ -438,6 +447,8 @@ enum data_queue_flags {
  * @wd_count: watchdog counter number of times entry does change
  *      in the queue
  * @wd_idx: index of queue entry saved by watchdog
+ * @txstatus_inflight: number of entries for which a TX status report is
+ *	expected (only with %REQUIRE_TXSTATUS_SAMPLING).
  * @txop: maximum burst time.
  * @aifs: The aifs value for outgoing frames (field ignored in RX queue).
  * @cw_min: The cw min value for outgoing frames (field ignored in RX queue).
@@ -468,6 +479,8 @@ struct data_queue {
 	unsigned short wd_count;
 	unsigned int wd_idx;
 
+	atomic_t txstatus_inflight;
+
 	unsigned short txop;
 	unsigned short aifs;
 	unsigned short cw_min;
-- 
2.56.1

