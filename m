Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481288;
	b=oPkrU+3SUmfe0cAumEUcBxJvnNb1O4Qu9CC0EoYHu4/M5T+hAV9K3dFs3wzmrUxp3O1Y
	 sevJVX4PLq+Qi6uJNC9iP9r9CHY0ROnyYg+L3bSOranc0C+ts0Y+SIGJ9gVjPHl5H+hZb
	 IXLW8bEGAqhS3bPn10iL+plEHILipSrFPXyWV9lhsWbWF3LdF1TaAYyuixM9oFXHE7e1C
	 2pAOxung8tKIkHFnv84nj7ia9QY7lRoD47GnXFjLU9CMXvjP6P2J74JfmilKgvrFXSsja
	 jKJepbLr1jJbp2E286LrA9fMl4j+yovlzj4MyBjBr/h0IV7HzGSOHCmbP2ZgpPGljJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
	b=3/unntdZ+m7uHV8F5/kL5rAKG0jq1OaF+/gczHM5SGCPVGHfaaajUdSulUp/6hEFzDrw
	 BLDnynkg2IkiKhSRjgsTtmW35jFGEG7H+5LrCTfB9AUOstMlv3Hu9I4gFDev/5HpmFDzP
	 yYrZAl5jGHLhC/F/7OVYJGQRqyapKB5bIatX0EviHhgNt/LwhUtnZPV71bC8qG0ZqTRzY
	 JeQ7uqqHn3YTS+dTDnG4VdX7sNm5o9OKJFgQIjfipbcDp6STf4n+HtntEG6LGPy5wvDeS
	 rDCpyLpukRRhOhmkJIR303yoYHQcSDGmS7eIVF1s5AnqTM1gR6354JsIjt5d0ivpCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nao+oSKD;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B6A606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B6A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nao+oSKD
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so28311375e9.2
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481286; x=1795086086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
        b=Nao+oSKDv4eVOjcowbDzZDBW54xMogqN84QOYYLSuvIHO7jw99hIzeybnZENMt3amq
         taJANTQ7tudipdYp9f+7JUfWdxkfqPvDhcJ3RnZSe/nSQ8y8WkEKFON4SAgXOQ+lgp6j
         4GF7Pmcj4xmF6CezGdvYSU/rk3QA/OZJuyXobNPL1gPZK6+cdiiPsPjtJV0BQYXZ8NS7
         JAthdlWewyQpTvcHrSfOHGdi/4Ib0vXu6iKt7AB+FlAdxp7uzCGHl14A0nue0XdjuJ9N
         GEPa4FLD/idzzt0O3CLJRHKA/TvdGUMiH0HmLTGf8pBAzSXUR+417CAJM6k49YDPwfbg
         C1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481286; x=1795086086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=POVXBINIjtay3B3IQVKcen/EZ7XVUhcPPfdW9Ywiirg=;
        b=h41anCisl8UbcXfJCawXkwBueMvkafSsqOesVRlGK1dBvlKygxfaIbxNvVUpCRJK6I
         ww3zySJPvbSUdSbUiFqlx6eIqnohhzy+HFFeeuAC6DaBIIx2/A5VeZTAlfQi4o2G+v6M
         uIdbnon8ScrCFXURf2f0pGWMJ0c6zAuB0Kthm9AIkyqrWAR1YwLGb4heyQcv8ytet+F4
         nSarRc58I8Koge2Of0lAAR8q2LvKOJgsqXeCmNhJn9hL2nyCuCbPPS145V1L8ejaFuRC
         0phwsssVkM+QN+A5UhfrhNFevan5MPLFuwd6DwM3vyCxX1RRPZKpyuSrPu2mXZDC+rz0
         59IQ==
X-Forwarded-Encrypted: i=1; AL+hErET4sQ6x1KsxdYvgY/7HN55CbgglSfxi+BRt6x6myzePvpl+6feX4+G82eyqasRpyCA4f/s3YqkpDFHQdVwMg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VXVKUad2xHyhvz8bd2CLSHh6wD+WN3nG7hRdOhyRzuoowrPdV
	tg8UpXoc2aRGZd1VvK7pGBhHmfrysqpHhxqsNcFXm9qE2nb7phW4IvwB
X-Gm-Gg: AYBFou36kesofbZLiv9ho/o1MQNMLZFZv3sf7mKKF44iaGdXDg9CdzaSLPwaKNmghT6
	C3M7m32uNgd1uzcFMux0Q06l83t0BvTH1BzFv7mLvvZ70x5Cc8G6SeEZa/2dHZIOX+7rfILJ9wM
	3dQwnwmWrChTonHVWFkQUkzwoVBvYNR3lpHnAucTcQRdBPnUuQkRSVGmOP4i6MNDwDYzj2lJm3A
	KObkJJvslyT657ncKBtX+5ei4jG2LcboyvBXi8b5/aEtAYoGXOwVRR3gOS0cGO0WZScf1PgVhTV
	SRUBp+Os7ZoMxP5c+7JcSMNsGcKKWosH8NQwh2tPI8WoOfixjo9WUaR5ZDWxHKSjAepaZp4CyS+
	KPSBB6o/YSovBinyx8yuUNBI7z2I1KEraXfMTmqOO9LxP6iLw0hwFTVP7ZEE28KeMDqv5CwOfFR
	G3DhiVLG3fsJ9KRsBLTOOBpOLN4IHv8k+685lYKGVG4OOSZS2OX9MOZFvvRL2mscEYWYj9ezsPz
	/uNhYwqNy4qiPzUXWChk67PuauAtapKCOPYwwpBa0/Rk5xT5qqlrvTCh+Y4sEd1tDDcnUUQJlHk
	D3Pw8Z3B6bCH+T+3DSo3gxcqwxhlCY/BNNmA6afgpeOlmJvG+OJ9zIbkoIw2dLFzL45QnTaTKFs
	EKw==
X-Received: by 2002:a05:600d:82e4:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4ba093cd6d3mr118257905e9.31.1794481286017;
        Thu, 12 Nov 2026 03:01:26 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm58546125e9.14.2026.11.12.03.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:25 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] wifi: ath12k: do not wait in resume for a reset that cannot finish there
Date: Thu, 12 Nov 2026 13:00:06 +0200
Message-ID: <20261112110008.1229-3-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20261112110008.1229-1-tvlad744@gmail.com>
References: <20261112110008.1229-1-tvlad744@gmail.com>
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

ath12k_core_resume() waits up to 20 s for restart_completed. When the
firmware crashes during the cold boot started by
ath12k_core_resume_early(), ath12k_core_reset() powers MHI down, which
destroys the MHI channel devices, and up again. The driver core does
not probe the new devices before the system resume is over
(device_block_probing()), so QMI cannot come up and the restart cannot
complete while ath12k_core_resume() is waiting for it:

  mhi mhi0: Wait for device to enter SBL or Mission mode
  ath12k_wifi7_pci 0000:01:00.0: timeout while waiting for restart complete
  ath12k_wifi7_pci 0000:01:00.0: failed to resume core: -110
  ath12k_wifi7_pci 0000:01:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110
  PM: suspend exit
  ath12k_wifi7_pci 0000:01:00.0: fw_version 0x10097fff ...

The resume takes 20 s longer and fails.

Let ath12k_core_resume() go on as soon as a reset starts during the
resume. The restart then completes after the resume, as it does for a
crash at any other time.

Fixes: 8d5f4da8d70b ("wifi: ath12k: support suspend/resume")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath12k/core.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 42a9cd28c652..b1d1247a0dc6 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -224,6 +224,7 @@ int ath12k_core_resume_early(struct ath12k_base *ab)
 		return ret;
 
 	reinit_completion(&ab->restart_completed);
+	WRITE_ONCE(ab->resuming, true);
 	ret = ath12k_hif_power_up(ab);
 	if (ret)
 		ath12k_warn(ab, "failed to power up hif during resume: %d\n", ret);
@@ -243,6 +244,7 @@ int ath12k_core_resume(struct ath12k_base *ab)
 
 	time_left = wait_for_completion_timeout(&ab->restart_completed,
 						ATH12K_RESET_TIMEOUT_HZ);
+	WRITE_ONCE(ab->resuming, false);
 	if (time_left == 0) {
 		ath12k_warn(ab, "timeout while waiting for restart complete");
 		return -ETIMEDOUT;
@@ -1727,6 +1729,10 @@ static void ath12k_core_reset(struct work_struct *work)
 	int reset_count, fail_cont_count, i;
 	long time_left;
 
+	/* The new MHI devices are probed only after the system resume */
+	if (READ_ONCE(ab->resuming))
+		complete(&ab->restart_completed);
+
 	if (!(test_bit(ATH12K_FLAG_QMI_FW_READY_COMPLETE, &ab->dev_flags))) {
 		ath12k_warn(ab, "ignore reset dev flags 0x%lx\n", ab->dev_flags);
 		return;
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 3a92a4b03359..2d8d91afb66f 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1072,6 +1072,7 @@ struct ath12k_base {
 	atomic_t reset_count;
 	atomic_t recovery_count;
 	bool is_reset;
+	bool resuming;
 	struct completion reset_complete;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
-- 
2.43.0

