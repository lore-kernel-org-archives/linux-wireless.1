Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481320;
	b=BxSe32sJd4FeAYPrOUga6BRq1u33sd0/N74TiuBYgO9/QATFlYRFBuB1PLSWStCK0riD
	 Xks8w0cXlBJpyuxVeNel5B+5+YzOP85ULzofkS/2cp0ZCXQAmB8TZPQ/nbvXGWIZezoMP
	 5oRqwJgIKLEqVLhsZmRyZ9ZwZC+ztrePR0+ZWmBVPFsi5qi4d0lJNwcMVmHDr4EdkB013
	 V1+sCZ9rWc4Gq7crj9oPh54xzxKE+vkrDOixJ3n/Hj2Wusj3+99tBRbo6wXJh1BpaEb4B
	 boP8LnpkzeEP96uYtWuX5UrlCSW7CiQ+DqgjMI5mAY/ELmY737aciMy7gx4gQFuUpng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
	b=bqDIIiqbxmx0VC1oyyPxra/cnH28viD19AAFYVmOfaNNbrZehwiFyh945zC7GKXzR84Y
	 exl1rmQ9ONmAUazDsOGCoFJwXFC0CccmZvOVowbN9wjU7PuncvsdOCFP7hC+pYvjuLCGE
	 SzV0AnSdiXnjlDDWp02IVgfyVqysUhUlm/VLB+O4CZORMrwtZ86XD0zMXP5FJDZGYWoDu
	 OiEPh+UFXJ1r2r62D6geOUrT2uNKupWUou91iDLDC5k+Urn/WagrFeIjW1elehsAgrGSh
	 YQxQ2omkHoPXCuIa+35rLVjpvoBdgt4k0VlTDjhcAQ9syNO68WnViTPMQaTR74aJnUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdZWTBpR;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4D7606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 11:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C4D7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IdZWTBpR
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so44591545e9.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 03:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481318; x=1795086118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
        b=IdZWTBpRDQ5xZAT7yTt94VHQiSSk7N/muTB1y1ZdpsF+RxvcXpOuu6OmERaXGwlGdY
         JvpgokfrDJbSXXEdUepY4Hg3Xi1hbHRfmRW5ZTDN1WiRM9047j9DtfIrzIXcQgoA5KHQ
         ON19ikSn2rjglTnqfhvqN/JyJjK/pPgVZinrIUSf4OPYFMzEy5bX4gNFLm0hGwYmk1uE
         g7TSAIrbf3itX2iIf2gf47jP5Q22XWSixtJKeLrjNUZ5ciLABAOdN2rxhTcxjBFpVUQV
         3zR5Qmz1WulkdmyTxntVtRoKgMOrJ4P0auA6QdqH2CpdVOLATOeLzOroPG9k0xSIpt1s
         Q/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481318; x=1795086118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSUy1vY1eFE30aKfLNhqOPUvCuItfxCfRy/wTy6x1VY=;
        b=cuGGXI20t9501gnRiQVlKB1EeVLmIWfULMAUrSa2Pw5zbNwY7esTeGkrwCyNoqaRKM
         KwE6qbUJlIO3GYEcx+asrZbTiTUrXFA0he+wzkQiCHyF0DRpwWbmSM/me7QCLDi8HRof
         rbHkmynEbskonPjA1rvHnsmxlNbcPyv61XZEPY7cchTkju7ilOmorRCWByCVX51KrKNE
         AsTtGcw2epVjRirOkzaeYzDFSFf5Xv83h3kyGFYVR0kPW5HH+XzcCgbB04iVAr8sUKes
         NAQe8NRzu4SGnghnyWQx2qAxb9qYHuEEV3pNtXz3/KRudStD1RT3TtfaoOV/4swmrAKo
         onFA==
X-Forwarded-Encrypted: i=1; AL+hErEvIFe9vjP9WHB3PnSgH2IFOv4lJ/L+2JkVzO7D/iUU/NYXKuTU9KdEXIxyTjjUrk/1YHK9KObQDqrVR4Ivbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8O0omhwHCpLcT2uV6Su0Gc+Bgk+kWn6bUcgfU8yxmSwK6wL7Ap
	0YsruxPTOOxTVHX5unwCu/DIOtqsnPFbkMMcMd+02N8a8b8e+z8wLT3c
X-Gm-Gg: AYBFou1HEWyi02AvfRX28c7+jbHnd6rI9gsUesO8SQ4yciFE01t+2mC1iIsdylamKq8
	n/z67e/RvBgdJSxto/T5YxZvr39GkGh0oOGcU6i/C2CgckRAdiXlbQuKODUaoSygjUnWLRALH1+
	lx/JMHLrO+dBZZ6uiGcKztsyjA7iKSw1P/dIqHlB2EO2Lg/eToQLEHXVc9a85tRJWhikm7uYu2D
	97E0mCnB5VrM1lZlHCBRip3ieFEqQjEFfLjHDWXVzdsfDAOoKcfEshDGj/hayz04qo+dV4hL7jH
	fihypKZdnl5lVxFoms5D82BSG7gJudtAwwAmZZbKA7hlmLqC3BQUhA8VyJ/qG1O5PRP63hEwNqr
	fS5GnT0m9UPwTNPeHCS3az52kC/7yMLkQ12iha9XY5XqFRSgBqWiYvLsk/rr6cuNbu0MSA0dL8V
	N41G6xnCzABsXdZhNL/3SCtlxghqneaKdXxdDWN8YB+P2olsm6uxvcLX5nq5wEquizoigDKcD4I
	DTx2t7kiOgOzxW0oY0FrHmCovT6TWk7vlAyS5AEgHIRj+28VdguGnZxxsRhINH9HNartjlubqdB
	PKVLyvrFYzAR0sCoj+vYOAhMTG960J5RA6Lh2+2svZGCHlRna7kbWpnp
X-Received: by 2002:a05:600c:e554:b0:4bb:534b:ada4 with SMTP id 5b1f17b1804b1-4bb534badf0mr5110835e9.33.1794481317703;
        Thu, 12 Nov 2026 03:01:57 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2acf81sm58579815e9.14.2026.11.12.03.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:01:57 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] wifi: ath12k: unregister the thermal devices of a radio only once
Date: Thu, 12 Nov 2026 13:00:07 +0200
Message-ID: <20261112110008.1229-4-tvlad744@gmail.com>
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

ath12k_core_reconfigure_on_crash() calls ath12k_thermal_unregister(),
and the devices are registered again only when the start that follows
reaches ath12k_core_pdev_create(). If it does not, because the firmware
crashes again or the start fails earlier, the next restart unregisters
the devices a second time:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000050
  Workqueue: ath12k_wq ath12k_core_restart [ath12k]
  pc : hwmon_device_unregister+0x24/0x90
  lr : ath12k_thermal_unregister+0x7c/0xf4 [ath12k]
  Call trace:
   hwmon_device_unregister+0x24/0x90 (P)
   ath12k_thermal_unregister+0x7c/0xf4 [ath12k]
   ath12k_core_restart+0x3c/0x210 [ath12k]

Skip the radios that have nothing registered.

Fixes: 151322bccdbd ("wifi: ath12k: add basic hwmon temperature reporting")
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
 drivers/net/wireless/ath/ath12k/thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index 97fc49c40ac1..7707ae4eb683 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -257,7 +257,7 @@ static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 	struct ath12k *ar;
 
 	ar = ab->pdevs[i].ar;
-	if (!ar)
+	if (!ar || !ar->thermal.cdev)
 		return;
 
 	hwmon_device_unregister(ar->thermal.hwmon_dev);
-- 
2.43.0

