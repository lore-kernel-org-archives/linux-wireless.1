Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795331048;
	b=hFUbFcbFShnEWKUfL0iOEvGAjJtS6gNg99+iM+kcbvaJPMzPqq+1g67WTzAHpPDW5OQx
	 hzoTD8uypi1sZGwhTgGgj9fqt9vLmyBpuzNH/qozlpn6cwe8STzyVLJlfRX2TE13eB6vQ
	 YsXwtcWLq4X5cvWtO0SZqtRr+cIsPTcx4BwrAJbv6bClHOyQkAkuf0iKwP00czzDg8yVx
	 pcnBYieVJVu7fBOvE+EToB5OLE4gSu25LW1YT5aRdSiXx5oPCKpbSzvLdvOLimhsizW49
	 Zgdniq3r2HsKUz/jiuYR18Jenm/giy3puj7InNztmcydH97IowDdGDjjOtldv2iBuyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I3pBK1zk3PgL7FtPm0azOHVG4m57HtPDUlylND/2Rfg=;
	b=B8aHo0jbIaWhwb4EjQ7iccPPVVHfAMIL1dFVQ/1RElCoo2kd0oRIpW/mACMkXuSizqoP
	 0RMjBFrqk39SPzLQ9mfx1skPkMKoHUFbP/CK0I5ZmBjF4plvhyoqQho9e4onj/PsWGlLl
	 0Kdvilaeijc72UoiF8UsQtpGhUmdCTPA4PFzhWBfoZGITVfqJh8f7Sn2FURFSqycFBSxf
	 GnMG3UHwMF2x0nYCO/yHr2IcQJvVgMxRW9C736ct1+ML0oT+Vv8E+RrZNRyLVi/s9EYT/
	 HfIjn6UB2mMqvxfgFnltCsTctaUQNMhMSPi3nqQtWKfzGuOa04w+1eCzrXAMVVvWeRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUcuNYtd;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CD2606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4CD2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YUcuNYtd
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso855464a12.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331047; x=1795935847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3pBK1zk3PgL7FtPm0azOHVG4m57HtPDUlylND/2Rfg=;
        b=YUcuNYtdJFYPgMeEi5xDGa/4YJNftqmTvS5vcuZ+rh01Zzzcqhi877EurpWKnlKfqd
         peKQ7Q1/aCkFCvOvUfwp8oO7AnUpf27cHOYK0cKUmWXQesVDNPWsVaF9DBOo4J7R4gk9
         bX9dJZ9lhg0d+c9UY5oCH3ZGLW0uL6MItYF+aSjyjtekqGV5mJTGaETzf8jwkSJqk0f6
         mOvLuXEYD9ciJ+TB6aDYnbVHOzEbLaXRQYB6QqgZuTLezbBVL3VUNepLG81HeZRi1RTD
         lM5TzZsNTlXz9iATR4tedBKJsyPtcnwyroZt+qTvuriOmTxYdmM8GkUqkhT6N61GCYIC
         6MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331047; x=1795935847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I3pBK1zk3PgL7FtPm0azOHVG4m57HtPDUlylND/2Rfg=;
        b=K6psS5H922ms/1Ung4YA2vP62CTP6nj6EhggWY2JQehSqq5rmI0emCRZiFJlQ9Q8ku
         wB0eTWi/5dJA6Y2TPLl9m9GdKV5rhflYGuajxsdYNyZHLz+Vj4ab4Hto8IQ83G6g45xc
         ZsJnYO5LjP3H3U5FJE/5pEd7j9V46ijqgvuefUkahOTRJ9UqeyzMz1PpsZ/6BiHs16vk
         bsS6B4wmf3rcLSID03xtVC1nLwnef3EXyC9Q0CItyoEPk2rG+hs4Pqwr219ozIsuDGNI
         Pf9qwddLQQwB9LFsZd0omMC1og5+bY9xjfxgt1f9FLpmmkb6kuLtP+h4f9Y2VHZub1gt
         Lx/Q==
X-Gm-Message-State: APuU4Z+LBDhuOmsDcjnKN6zogdoQpZozyni9hppQbQLnnBFGn/KzUCrj
	45s12ckF65NmGLSzF6OwQXVSWzZNM+SlsYvzgXR8vc+1IxAyZbwZOMow9YCbfA==
X-Gm-Gg: AZFdTZdZZf9SgnVYLqw8z++tiILE2N7A+wtkupAW7zI4bIrVtok9qQPmedBL9HPnusd
	aizhHJPRzThKdLiZCS9td5/lZa/cJBcrG1DctPPR6sAZPLKUoNElU4CJ98V8nwaC2LAjYOvjuu9
	dTzf/cQ5GD+188kUFBxmpZhgZlf5kzcmshGDxTfY6goxFb/ZNMXgGB8NJHFThPHr81oJ5ZxdAL6
	qg550HGma8Qu04dFR+T33K18Mv2OpMUA3w0o0jRfQ2lPP0U/xJl8m31M3p7Z0lkP/A4gQw35xYk
	cRkuoHZAR6J1c6ApJ+UblsmN8iM+U9oN+iTu60zzqZS0EsjKvFgfRCNUGSWyXrWCEGmSiTQ4+PS
	ciUbWScN+qpUunG53dry8sXI4J84WnhRcSuM/adk+6yoa6bTbdwrCwExUU0PtA3CjDq6EDxuobA
	x8a3ATv+Ox3Co1YsVX4YqkTfzqeihYEdUjZ6BEXOO1hAj3WZ+phzF3Y8wTQ6s3EAaxvw9/WpeDZ
	SvToSI7IZOHjZi/xyPtCQbAHo14HbWiYpYykA1x9joTB2LJ0AYfRr59zttGEDFn0BZ7ypwHi9hK
	PPOSofI1EcDftxpc9tQWqDlsQKIhshnCtd3wjgsq2HSZ+xv+ACx4mN/B5hWKoo/Z3Mvk+w6wn45
	J6qv7inMeT5MnoJ/2yIpc4SKQZ2tjnSfX5SDUo/K9AyP4nmn+s6LBXW+Xy7gt5JZ76aJYpB8VfU
	Q3KszP/kEnt4VdnyZ8+g==
X-Received: by 2002:a05:6a00:a01:b0:893:4980:630e with SMTP id d2e1a72fcca58-8c87c38b5d7mr6704971b3a.31.1795331046842;
        Sat, 21 Nov 2026 23:04:06 -0800 (PST)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm3609721b3a.27.2026.11.21.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:04:05 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 2/3] wifi: rt2800: support TX status sampling
Date: Sat, 21 Nov 2026 23:03:41 -0800
Message-ID: <20261122070342.101054-3-rosenp@gmail.com>
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

Implement REQUIRE_TXSTATUS_SAMPLING in rt2800lib.

A TXWI packet id of 0 tells the hardware not to report a TX status for
the frame. Frames that wait for their report keep the queue in the
packet id, with entry 1. Rate control samples carry RT2800_PID_SAMPLE
and the low three bits of the requested MCS: every MPDU of an A-MPDU is
reported with the packet id of the first frame, so a sample can't be
matched to a queue entry, but the requested MCS lets the number of
retries be worked out from the report alone, as rt2800_txdone_entry()
does from the TXWI. The MCS group (stream count, short preamble) comes
from the MCS in the report.

A report with a packet id that doesn't match the first waiting entry of
its queue, which can happen for an A-MPDU led by a waiting frame, is
ignored instead of being given to the wrong entry. Before a report is
matched, the entries at the head of the queue that don't wait for one
are completed.

Waiting frames of a queue all carry the same packet id, as the sample
bit leaves no room for the entry index, so a lost report can't be told
apart from the report of the next waiting frame. A waiting frame that
the hardware aggregates behind a frame with packet id 0 gets no report
and is completed by the TX status timeout. That is unlikely for EAPOL,
which goes out on VO, where mac80211 doesn't start BA sessions itself.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800.h   |   6 +
 .../net/wireless/ralink/rt2x00/rt2800lib.c    | 175 +++++++++++++++++-
 .../net/wireless/ralink/rt2x00/rt2800lib.h    |   1 +
 3 files changed, 180 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800.h b/drivers/net/wireless/ralink/rt2x00/rt2800.h
index 8930589b4967..9348fb87c64d 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800.h
@@ -3116,6 +3116,12 @@ enum rt2800_eeprom_word {
 #define TXWI_W1_PACKETID_QUEUE		FIELD32(0x30000000)
 #define TXWI_W1_PACKETID_ENTRY		FIELD32(0xc0000000)
 
+/*
+ * PACKETID bit of rate control samples (REQUIRE_TXSTATUS_SAMPLING), see
+ * rt2800_tx_packet_id().
+ */
+#define RT2800_PID_SAMPLE		0x8
+
 /*
  * Word2
  */
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
index f15533c5be9b..c65243f3d062 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
@@ -793,6 +793,36 @@ int rt2800_load_firmware(struct rt2x00_dev *rt2x00dev,
 }
 EXPORT_SYMBOL_GPL(rt2800_load_firmware);
 
+/*
+ * PACKETID 0 tells the hardware not to report a TX status for a frame.
+ * In sampling mode, frames that wait for their report carry the queue and
+ * entry 1, and rate control samples carry RT2800_PID_SAMPLE and the low
+ * bits of the requested MCS, so the number of retries can be worked out
+ * from the report alone. Note that every frame in an A-MPDU is reported
+ * with the packet id of the first frame.
+ *
+ * With RT2800_PID_SAMPLE taking the top bit, all waiting frames of a
+ * queue share one packet id, so a lost report can't be told apart from
+ * the report of the next waiting frame of the queue. A waiting frame
+ * that the hardware puts in an A-MPDU behind a frame with packet id 0
+ * gets no report and is completed by the TX status timeout.
+ */
+static u8 rt2800_tx_packet_id(struct queue_entry *entry,
+			      struct txentry_desc *txdesc)
+{
+	if (!rt2x00_has_cap_flag(entry->queue->rt2x00dev,
+				 REQUIRE_TXSTATUS_SAMPLING))
+		return ((entry->entry_idx % 3) + 1) << 2 | entry->queue->qid;
+
+	if (test_bit(ENTRY_DATA_TXSTATUS_SAMPLE, &entry->flags))
+		return RT2800_PID_SAMPLE | (txdesc->u.ht.mcs & 0x7);
+
+	if (test_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags))
+		return 0;
+
+	return 1 << 2 | entry->queue->qid;
+}
+
 void rt2800_write_tx_data(struct queue_entry *entry,
 			  struct txentry_desc *txdesc)
 {
@@ -836,8 +866,8 @@ void rt2800_write_tx_data(struct queue_entry *entry,
 			   txdesc->key_idx : txdesc->u.ht.wcid);
 	rt2x00_set_field32(&word, TXWI_W1_MPDU_TOTAL_BYTE_COUNT,
 			   txdesc->length);
-	rt2x00_set_field32(&word, TXWI_W1_PACKETID_QUEUE, entry->queue->qid);
-	rt2x00_set_field32(&word, TXWI_W1_PACKETID_ENTRY, (entry->entry_idx % 3) + 1);
+	rt2x00_set_field32(&word, TXWI_W1_PACKETID,
+			   rt2800_tx_packet_id(entry, txdesc));
 	rt2x00_desc_write(txwi, 1, word);
 
 	/*
@@ -1119,6 +1149,137 @@ void rt2800_txdone_entry(struct queue_entry *entry, u32 status, __le32 *txwi,
 }
 EXPORT_SYMBOL_GPL(rt2800_txdone_entry);
 
+/*
+ * Complete the entries at the head of the queue that are done with DMA
+ * and for which the hardware will not report a TX status.
+ */
+static void rt2800_txdone_unreported_queue(struct data_queue *queue)
+{
+	struct queue_entry *entry;
+
+	while (!rt2x00queue_empty(queue)) {
+		entry = rt2x00queue_get_entry(queue, Q_INDEX_DONE);
+
+		if (test_bit(ENTRY_OWNER_DEVICE_DATA, &entry->flags) ||
+		    !test_bit(ENTRY_DATA_STATUS_PENDING, &entry->flags) ||
+		    !test_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags))
+			break;
+
+		if (test_bit(ENTRY_DATA_IO_FAILED, &entry->flags))
+			rt2x00lib_txdone_noinfo(entry, TXDONE_FAILURE);
+		else
+			rt2x00lib_txdone_unreported(entry);
+	}
+}
+
+void rt2800_txdone_unreported(struct rt2x00_dev *rt2x00dev)
+{
+	struct data_queue *queue;
+
+	tx_queue_for_each(rt2x00dev, queue)
+		rt2800_txdone_unreported_queue(queue);
+}
+EXPORT_SYMBOL_GPL(rt2800_txdone_unreported);
+
+/*
+ * Feed a TX status report of a rate control sample (or of a frame that
+ * went out in an A-MPDU behind one) to rate control. The requested MCS
+ * comes from the packet id, see rt2800_tx_packet_id().
+ */
+static void rt2800_txdone_sample(struct rt2x00_dev *rt2x00dev, u32 status)
+{
+	struct rt2800_drv_data *drv_data = rt2x00dev->drv_data;
+	struct skb_frame_desc skbdesc = {};
+	struct txdone_entry_desc txdesc = {};
+	struct ieee80211_sta *sta;
+	u8 real_mcs, mcs;
+	int wcid;
+
+	wcid = rt2x00_get_field32(status, TX_STA_FIFO_WCID);
+	if (wcid < WCID_START || wcid > WCID_END)
+		return;
+
+	real_mcs = rt2x00_get_field32(status, TX_STA_FIFO_MCS);
+	mcs = (real_mcs & ~0x7) |
+	      (rt2x00_get_field32(status, TX_STA_FIFO_PID_TYPE) & 0x7);
+
+	rt2800_rate_from_status(&skbdesc, status, rt2x00dev->curr_band);
+
+	if (rt2x00_get_field32(status, TX_STA_FIFO_TX_AGGRE))
+		__set_bit(TXDONE_AMPDU, &txdesc.flags);
+
+	if (!rt2x00_get_field32(status, TX_STA_FIFO_TX_ACK_REQUIRED))
+		__set_bit(TXDONE_NO_ACK_REQ, &txdesc.flags);
+
+	/* See rt2800_txdone_entry() for how the retries are counted. */
+	if (rt2x00_get_field32(status, TX_STA_FIFO_TX_SUCCESS)) {
+		__set_bit(TXDONE_SUCCESS, &txdesc.flags);
+		txdesc.retry = mcs > real_mcs ? mcs - real_mcs : 0;
+	} else {
+		__set_bit(TXDONE_FAILURE, &txdesc.flags);
+		txdesc.retry = rt2x00dev->long_retry;
+	}
+
+	if (txdesc.retry)
+		__set_bit(TXDONE_FALLBACK, &txdesc.flags);
+
+	/* rt2x00lib_fill_tx_status() wants the first rate that was tried. */
+	if (mcs > real_mcs)
+		skbdesc.tx_rate_idx += mcs - real_mcs;
+
+	rcu_read_lock();
+	sta = drv_data->wcid_to_sta[wcid - WCID_START];
+	if (sta)
+		rt2x00lib_txdone_sample(rt2x00dev, sta, &skbdesc, &txdesc);
+	rcu_read_unlock();
+}
+
+static void rt2800_txdone_sampling(struct rt2x00_dev *rt2x00dev, u32 reg)
+{
+	struct data_queue *queue;
+	struct queue_entry *entry;
+	__le32 *txwi;
+	u8 pid;
+
+	pid = rt2x00_get_field32(reg, TX_STA_FIFO_PID_TYPE);
+	if (pid & RT2800_PID_SAMPLE) {
+		rt2800_txdone_sample(rt2x00dev, reg);
+		return;
+	}
+
+	queue = rt2x00queue_get_tx_queue(rt2x00dev,
+					 rt2x00_get_field32(reg, TX_STA_FIFO_PID_QUEUE));
+
+	/* The report is for the first entry that waits for one. */
+	rt2800_txdone_unreported_queue(queue);
+
+	if (rt2x00queue_empty(queue))
+		goto unexpected;
+
+	entry = rt2x00queue_get_entry(queue, Q_INDEX_DONE);
+	if (test_bit(ENTRY_OWNER_DEVICE_DATA, &entry->flags) ||
+	    !test_bit(ENTRY_DATA_STATUS_PENDING, &entry->flags) ||
+	    test_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags))
+		goto unexpected;
+
+	/*
+	 * Unlike rt2800_txdone_entry_check(), also check the packet id of
+	 * an A-MPDU report: it can belong to another frame of the aggregate.
+	 */
+	txwi = rt2800_drv_get_txwi(entry);
+	if (pid != rt2x00_get_field32(rt2x00_desc_read(txwi, 1),
+				      TXWI_W1_PACKETID) ||
+	    !rt2800_txdone_entry_check(entry, reg))
+		goto unexpected;
+
+	rt2800_txdone_entry(entry, reg, txwi, true);
+	return;
+
+unexpected:
+	rt2x00_dbg(rt2x00dev, "Unexpected TX status %08x for queue %u\n",
+		   reg, queue->qid);
+}
+
 void rt2800_txdone(struct rt2x00_dev *rt2x00dev, unsigned int quota)
 {
 	struct data_queue *queue;
@@ -1128,6 +1289,11 @@ void rt2800_txdone(struct rt2x00_dev *rt2x00dev, unsigned int quota)
 	bool match;
 
 	while (quota-- > 0 && kfifo_get(&rt2x00dev->txstatus_fifo, &reg)) {
+		if (rt2x00_has_cap_flag(rt2x00dev, REQUIRE_TXSTATUS_SAMPLING)) {
+			rt2800_txdone_sampling(rt2x00dev, reg);
+			continue;
+		}
+
 		/*
 		 * TX_STA_FIFO_PID_QUEUE is a 2-bit field, thus qid is
 		 * guaranteed to be one of the TX QIDs .
@@ -1201,6 +1367,11 @@ bool rt2800_txstatus_pending(struct rt2x00_dev *rt2x00dev)
 {
 	struct data_queue *queue;
 
+	if (rt2x00_has_cap_flag(rt2x00dev, REQUIRE_TXSTATUS_SAMPLING)) {
+		return atomic_read(&rt2x00dev->txstatus_samples) ||
+		       rt2x00queue_txstatus_tracked(rt2x00dev);
+	}
+
 	tx_queue_for_each(rt2x00dev, queue) {
 		if (rt2x00queue_get_entry(queue, Q_INDEX_DMA_DONE) !=
 		    rt2x00queue_get_entry(queue, Q_INDEX_DONE))
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.h b/drivers/net/wireless/ralink/rt2x00/rt2800lib.h
index c9d0417dc292..9774fcbff467 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.h
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.h
@@ -204,6 +204,7 @@ void rt2800_txdone_entry(struct queue_entry *entry, u32 status, __le32 *txwi,
 			 bool match);
 void rt2800_txdone(struct rt2x00_dev *rt2x00dev, unsigned int quota);
 void rt2800_txdone_nostatus(struct rt2x00_dev *rt2x00dev);
+void rt2800_txdone_unreported(struct rt2x00_dev *rt2x00dev);
 bool rt2800_txstatus_timeout(struct rt2x00_dev *rt2x00dev);
 bool rt2800_txstatus_pending(struct rt2x00_dev *rt2x00dev);
 
-- 
2.56.1

