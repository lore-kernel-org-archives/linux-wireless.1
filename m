Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795331049;
	b=SnVGFgISspClCJzje17WrcVUoSvjjQ7mf6W2Ym4hH+1Rt+Pjg230FE62rq4OprzrXnTd
	 EUnWHt3UO8D+bJHhBTvV1jz2+d+VrxDFY1rW8sSUUkNxp5EDEnAD3dVRQzJthGkVKY2hV
	 tOTVyZurMKIGb7tYLr0gMEJk521EDtJjgDX4hYrav8kq2r/nU8A2Ln4fcHa70zZ8MxjxF
	 GQi9kFwPO9WVC6k9dCezaQE/dYZcx5FDwTkRLtJU26hH+HY47B+XUyENAzQJA/Bag+6pb
	 etyfjwoM09ZyJOS3uYvRAXWb8exH5EAjY9rRDSCz/V3oKDjTFb5kUrKeWGfkoJ1tmEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795331049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=flxdRsSzhH87yYaqmDPftTp+raN16KeLCoiObTkhKrk=;
	b=xHeYWxu3fvrL4QMAJ28MAzUU4IJT5bwpEGWpr9j7vWtuaPCpOiR5crQEr0acNYdELqMS
	 OKyl+Bbsvmno1Mutj2hf+TAJ/gSQKrBKtHpXZp8k3Hid0Fy4MSgZFFaaVtOk2JT9ABIpx
	 bG2+W2cfAIMPD5kSqU16UiLrpna69EB8UWAH0UkKwBIkzFpAk+5UxvINAIDi3hLUqIjcJ
	 AO0L7Hhw4w4R8l+EWyoyKo2frxL3A5Q6PN7rriPLQCAvQ8O700Gbk23I7S85DtU2scr/o
	 rw28KArnKyy68A2i6oBjgeenxXI4sXK6CHW1180pbcc80yritQ//5jyzH7Jtao/pY3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnVBY+WR;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D33606A320
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D33606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnVBY+WR
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cddac941ed1so876538a12.2
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 23:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795331049; x=1795935849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flxdRsSzhH87yYaqmDPftTp+raN16KeLCoiObTkhKrk=;
        b=lnVBY+WR05iU13O8pu3NRCKHBeoc/kdenx396gyvBFRwG9s9+dj+TmnYS7wjd9dCmv
         quU10L8FSl02NIDnPleLYrT9ERHsm1N2xXNH9+VksDDMivOE3lEhm5GOFNYRKg737Cs6
         pSIKkDraPoIsi9kbxLgMaFKq0C+uik9zUKwblzzeiv6bwWFbshI26ZpRmIsptqrdNQg9
         bso0shcK/Acfa42IzQDEovCXb5thSIhSq8b+NwPa5/ifBka6tZi/ui6H6aNbfZD7NO/A
         tWLW4YD7Nw11y+IvR/tyOTln3WZ2pl5pkzHuSqzS9NtwdZ8/9hTKLTXKK7jQASrH+QqK
         OZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795331049; x=1795935849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flxdRsSzhH87yYaqmDPftTp+raN16KeLCoiObTkhKrk=;
        b=SrR4+caXRxXLCJgXhpeQIvTixL1g8Q6OX3XRHHbJ7vA2R8j6sGVeKiSY71DAa+PqCk
         f6zzbXjPAs4LxMqo7rf2fzw7ckPEjZAQbjdGiX2uRDwFSfq28CIhBYrtlV5ThuZ77FA4
         A89VN7kvLYWzGnoScsgxWkG6HgxiF/2zlt3rVgykPqk17arfJ9jfyeOhAZIXTegZ3JxT
         LmDfAdB67aNtPELwFt1nVtYm1GCx4S9t/KeGSCZ1LDIhEY1v+NKttJ3FLrQh4l51sbMe
         tqeuh6iZk1VzgdSi8gVnQL/Odynos3LsPyrBlLH9g0SqRvNPJ+/zBzUZzE87PzcsCKWx
         H35g==
X-Gm-Message-State: APuU4Z+gAh22Mq6AwS/Hnxquw50DK+6/aTq6fbNokXRHyOwNyOP8qAhP
	DHVdjEj6QplYf4MZUgQ4GJLxFGYG+0jTnvJs8sXAhW5M3q4LCj8/FypsKLzg2w==
X-Gm-Gg: AZFdTZespY+yGHvzobM3qpGv97BW55KVxr6kSQJG8mjL/2pEGoVw8THltetFy18iNe7
	Sl5FiNjfQhhXg/V/AQ87XEUqPfy4S9DsVSC4dVCQzeI4WjUWnrnaUHLZHH7wOc8B0/nYdilcNxm
	vxAAWlNYLd3OV76NzFIREnec2S1HyJFmLEV6PJ1yEMKiib5t6EdE5H3DtS8nnkKfbEWi/tNqT2A
	3KfkD+CawdebUvwmpqYdRX8CmSE2iahIH88z0xUzIj24SosVD4JnG6oNd1YMGVyazyw2g9C2nVp
	hrx6D6n66ir6uILa9lzRA222Hq8KjM6s7CRAOgDu4mPDy3MC7uqn0vKg806JsLCuuXf8WdsjhIR
	PmKYN0R0VZymVgcYuL/ad2BQ0e/id+y95pyWO3sIdj/PQjHuUWr1qoILJCGeGMb7bAGupnMF3a1
	ryHwLJa2Bmi2440ZNRWV/BDw1ibqrZl3Ngo2XKaOmK3hT2NAibcqZAJcYN8xvHSHvemAW9lmgI/
	50gXzQAeGm/m58/HKgICU8oVnO/MDQNKk4tF3y9Nf7LWaX65OqRHF5Yu4U7RLy7FVnqUIg15VWq
	b3aNq3QKczSwXKScbHx2AL6OiOKALJ8ibiqgwh0FcoPuVzcwnCqR6qm9CbcvyRBdr0lu6Q+Pnw6
	qrUkDaxaAo4elSsPHzoK6FS/5NNqSvEsU3OK7J6Hig+fdEOcAxuLsnVTU+KXjjd6K0CW303rEjX
	R1a3GjjIPtIjIYYoFyZw==
X-Received: by 2002:aa7:9065:0:b0:8a0:7140:7fbb with SMTP id d2e1a72fcca58-8c87d225fd4mr6037633b3a.51.1795331048812;
        Sat, 21 Nov 2026 23:04:08 -0800 (PST)
Received: from ryzen ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm3609721b3a.27.2026.11.21.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:04:08 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH wireless-next 3/3] wifi: rt2800usb: don't hold every TX frame until its status is read
Date: Sat, 21 Nov 2026 23:03:42 -0800
Message-ID: <20261122070342.101054-4-rosenp@gmail.com>
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

rt2800usb reads TX_STA_FIFO with one control transfer per report, and
keeps each frame in its 16 entry TX queue until its report has been
read, so the TX rate is bound to the latency of control transfers.

On the AMD X470 chipset USB 2.0 ports, each control transfer to an
RT3070 takes 3 ms or more (the host retries an endpoint that NAKs only
every few ms; the CPU's own xHCI does that within 0.25 ms). Pipelining
reads doesn't help, the host still serves one transfer per 3 ms. TX
there is limited to about 300 frames per second.

Enable REQUIRE_TXSTATUS_SAMPLING: complete frames that don't need their
status when the URB is done, read the FIFO while samples or waiting
frames are outstanding, and give the sample slots back only when the
FIFO is found empty.

RT3070 as station on an X470 chipset port, MT7612U AP, channel 6 HT20,
WPA2-CCMP, median of three 15 s iperf3 runs:

                       before                  after
  TCP TX               3.4 Mbit/s, ~340 retr   37.8 Mbit/s, 1-8 retr
  UDP TX (60M sent)    8.9 Mbit/s, 60% loss    43.8 Mbit/s, 0% loss
  TCP RX               10.2 Mbit/s             29.8 Mbit/s

minstrel_ht keeps getting samples with retries at all rates and picks
MCS7. A GTK rekey every 10 s during 60 s of saturating TX with an
A-MPDU session completes every time, without TX status timeouts. WPA2
(CCMP, TKIP, mixed) and SAE connect in both station and AP mode.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../net/wireless/ralink/rt2x00/rt2800usb.c    | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
index 15de3db12429..5dd849e3dde5 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800usb.c
@@ -104,6 +104,14 @@ static bool rt2800usb_tx_sta_fifo_read_completed(struct rt2x00_dev *rt2x00dev,
 	}
 
 	valid = rt2x00_get_field32(tx_status, TX_STA_FIFO_VALID);
+
+	/*
+	 * Rate control samples may produce more than one report each (A-MPDU),
+	 * so the sample slots are only given back once the FIFO is empty.
+	 */
+	if (!valid)
+		atomic_set(&rt2x00dev->txstatus_samples, 0);
+
 	if (valid) {
 		if (!kfifo_put(&rt2x00dev->txstatus_fifo, tx_status))
 			rt2x00_warn(rt2x00dev, "TX status FIFO overrun\n");
@@ -156,7 +164,12 @@ static void rt2800usb_tx_dma_done(struct queue_entry *entry)
 {
 	struct rt2x00_dev *rt2x00dev = entry->queue->rt2x00dev;
 
-	rt2800usb_async_read_tx_status(rt2x00dev);
+	if (test_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags))
+		queue_work(rt2x00dev->workqueue, &rt2x00dev->txdone_work);
+
+	if (!test_bit(ENTRY_DATA_NO_TXSTATUS, &entry->flags) ||
+	    test_bit(ENTRY_DATA_TXSTATUS_SAMPLE, &entry->flags))
+		rt2800usb_async_read_tx_status(rt2x00dev);
 }
 
 static enum hrtimer_restart rt2800usb_tx_sta_fifo_timeout(struct hrtimer *timer)
@@ -458,11 +471,15 @@ static void rt2800usb_work_txdone(struct work_struct *work)
 	struct rt2x00_dev *rt2x00dev =
 	    container_of(work, struct rt2x00_dev, txdone_work);
 
+	rt2800_txdone_unreported(rt2x00dev);
+
 	while (!kfifo_is_empty(&rt2x00dev->txstatus_fifo) ||
 	       rt2800_txstatus_timeout(rt2x00dev)) {
 
 		rt2800_txdone(rt2x00dev, UINT_MAX);
 
+		rt2800_txdone_unreported(rt2x00dev);
+
 		rt2800_txdone_nostatus(rt2x00dev);
 
 		/*
@@ -615,6 +632,14 @@ static int rt2800usb_probe_hw(struct rt2x00_dev *rt2x00dev)
 	if (retval)
 		return retval;
 
+	/*
+	 * Each TX status read is a USB control transfer, which can take
+	 * several milliseconds. Holding every frame until its status has
+	 * been read caps TX at one frame per transfer, so only frames that
+	 * need a status wait for it.
+	 */
+	__set_bit(REQUIRE_TXSTATUS_SAMPLING, &rt2x00dev->cap_flags);
+
 	/*
 	 * Set txstatus timer function.
 	 */
-- 
2.56.1

