Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489263;
	b=UUYlN58mIh0RdifjYq/wsKGcDpnpw0ROyVTcFiYGlslWVDHrPoXnd6DJ1Vn//IsgIXeY
	 q8Ckw2Hhhlf1UUbqliPRuan1ztxA30UeqFRgLau7V16cyF4GX9HXDQifiXfBaN90sl9xM
	 wv1mnDvdVc4+6J5YaZs4u7GiPSAKMIWcHknRyzlXeKJ7Yh8Vr1J8wen/30gPyaHZ3ZRHT
	 n0/p8QvzdeU5vCalYerpJytiyk8w4Wq4GS5tcslXZ41R91eJQQVJhAVJ/djJCCaGPgNeo
	 22Tvlb1AkvotoCfje/67ayvY3uPt1sWnTM3ywuoSDXtc/v2dQxeTlB1oEpW9N3pmNIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YUIf9+mCMOGNl2geZMGhw0spSlF1/XyFQpN5bks8zug=;
	b=kTzc9U5pHn1wWPlGzUGbIlomqFTel7vrtFG8rkgW61+/ej8Jbye7fpn5gtkkZQZ1b2el
	 7A4fs7sJY+KU2Cz6zYLv/bQku0hAJBtjl0rYRgrt4R2jJRqNo7534HnMuNCB4Vfmw/mCe
	 iutki5SOjNetnwoWSNUV2+O3EZWwyAL1nuhBijJmxbzq7NU8Inp1EEhgbtbDaiKJih3BV
	 GEjyRrHB6dKNbYWOtnicbIOJUrwCN66a+x1CELCbfw/BB+DhiGqFmUaU7uVQgz6PKIf9b
	 sTYOIae0z9FjLZ9lEKfttX/TlOPI5NbYx8HIdjY8rtgshj4R/8yFk1cXbvyqVnB6Cig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3eiYG4L;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B641606A327
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B641606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3eiYG4L
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so2140079c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489262; x=1795094062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUIf9+mCMOGNl2geZMGhw0spSlF1/XyFQpN5bks8zug=;
        b=t3eiYG4LkG/KbLSMetYxzqETR3GDnIQj9EIZGy1cPyVJSj43aoZ5FxQo4t2DKNSEMR
         lmHEsHvBtD8Q+evLwt42nBoAkE5XwOmGAfx6a+hp5a9KVqqMRhoZUo0bWWMqwODjztNy
         LQ+xuLP+7OlKFPEWlC9jJ8p45IDJlxuUo2+fDuVdeves1RyPyHR1ZxpEl9q4Bn6Idexy
         I4Y5+RWp0hqshUiAiwZhgaRfXG8HC2bf31d8lAF/6vOtRdsrLmehJFkfyB16SxNe8ep0
         v1jw98c7NuclXooSoLya11zaPff+bI71ArwR8SEP9yXm6wpSV+AieXCnuTmFkbGSAnU5
         8iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489262; x=1795094062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUIf9+mCMOGNl2geZMGhw0spSlF1/XyFQpN5bks8zug=;
        b=iAxK5lAQhXGabeycUiiXSwHOEBDfXlJNM/8hFaXp1PCP9QTsHSIzomLScTGxlS7WDC
         uEn2yPI07nMP95kPC9O+efwXxKw8hQD0Blvmrvmp1z7r0MnBlh1+Wpn5qI3CE8NT1Sj0
         f4Ab2b6ow9shCCR5/2mOPCc2F4nEIDTnSzLgCPHrtQQve8reudJIqoe8fLVVlm4clIy2
         2nOC/v3rxfAiyLaif8iChceJCb0GHF5RNNPovLb9z8AL+s75MKHZvT0QtHY71/FAylpX
         BUNbFl+8DTJIhylcWqw+TLtuK/AKR/txXcp7ITOzbMYEk1CN8obgfrU8uvh270aZwDpG
         Nbzg==
X-Forwarded-Encrypted: i=1; AL+hErFE1kErFqYebl8VSBFEQdSPMKKGqIuNliSEixGUeuDEIlpPol8QlfvFaeMD907Azbc5nJiqyItYia2sSytIOQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/QZK2hVMZR+ZFdlqnzQ49C371OxMwZAnWTOOXVkCiEp+C3p7MW
	TEW1vHn6Th6/dQfCrSF7PSwBuH9IMc0f3AhWn9rAYvCNlXZivUO+LIj6
X-Gm-Gg: AYBFou0r03/qLZtl9kdNPbuJg3veyCbUP8gaub8tbRdiP88J2t8H75IVhsa1/OSf/n2
	+TrPhRYnECQgUCwUwMYmiGoRxhbtBx2QSr3zQqakz05sOgIj3/J7R13F/D/TVt8bQvwfIJ1FEbR
	yKcwPiLxA15HaxIaVSgoLqzOLQXS+8/2WWodgRndZ5iVcysc7FV2TwhSn1R8Yq2WtMkpqrRKVvz
	1uTBRrZHVux2P4NyxsNK9HvmYY5+i9TxfkFqY4OMrFPhi+/v1wWlElV2jLrWN2oDDy6brKl94qA
	WV6EIKTzflAULAD/OxHgGGjJGgXIskbQaPASpL78/UunZdu2PNTz2chrFi0bzy14CNmF6+84wAH
	OwMRpJGsS+QVXLn5KM5qvQbJMkQOn8R6QeMBffKOHPES/NarOGC6VFr+s3R6RNvie0qXwYOzq9X
	+pBO9ZBRkIY1oUfRue8MKN7JwsslNe8go6W/lbRxZHM9kYKmh7g0eiYIQs1F5FfQjNctHAFRD/d
	zh3Zi2V3i6J2dMzCpj3Ls9FF02wMZHWAzEezqvRECfqQyErVvTUtrWNvJLYqW6ZdcAufbCetM/X
	IljkxqTKp4i9dSf1MhVspQ==
X-Received: by 2002:a05:7022:170a:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b3c02f06bdmr4731155c88.9.1794489262258;
        Thu, 12 Nov 2026 05:14:22 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b48a9c34c9sm8985969c88.4.2026.11.12.05.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:14:21 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v5 0/3] wifi: rtw88: firmware recovery fixes and LPS hang handling
Date: Thu, 12 Nov 2026 18:43:58 +0530
Message-ID: <20261112131401.236433-1-skalpesh942@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This series addresses firmware recovery robustness and LPS hang handling
in rtw88 based on review feedback from Luka Gejak and Ping-Ke Shih.

Patch 1/2 from the v2 series (DMI quirk for HP Laptop 15s-fr5xxx) was
already applied to rtw-next. The previous LPS leave recovery patch was
dropped from rtw-next by Ping-Ke Shih for respin.

This series splits the recovery fixes into three focused patches:

1. Patch 1/3: Clear RTW_FLAG_RESTARTING on stop and start failure.
   mac80211's drv_stop() skips local->ops->stop() when local->started
   is false (such as after a failed drv_start()). If rtw_core_start()
   fails during restart, clearing the flag only in rtw_ops_stop() left
   it permanently set. We now clear RTW_FLAG_RESTARTING in both
   rtw_ops_stop() and in rtw_ops_start() upon rtw_core_start() failure.

2. Patch 2/3: Skip already reset station in rtw_sta_remove().
   During station disconnect (e.g., ieee80211_set_disassoc()), mac80211
   leaves LPS before removing the AP station. If recovery is triggered by
   LPS leave failure, __fw_recovery_work() removes all stations via
   rtw_reset_sta_iter(). When mac80211 subsequently calls
   rtw_ops_sta_remove(), rtw_sta_remove() ran a second time, resulting in
   a double free of si->mask and underflow of rtwdev->sta_cnt. We check
   si->vif at entry and clear si->vif and si->mask upon removal.

3. Patch 3/3: Trigger firmware recovery only after consecutive LPS leave
   failures on PCI.
   Restricts recovery to PCI devices (rtw_hci_type == RTW_HCI_TYPE_PCIE)
   because USB (usb_control_msg()) and SDIO (sdio_claim_host()) sleep,
   which triggers a "scheduling while atomic" panic under
   local->key_lock during key clearing in __fw_recovery_work(). Retains
   rtw_fw_dump_dbg_info() on the first failure (guarded by RTW_DBG_FW),
   and requires 3 consecutive timeouts (RTW_PS_HANG_MAX_CNT) before
   triggering hardware recovery. Gated on FW_FEATURE_LPS_C2H because
   legacy chips clear REG_TCR on failure which masks stuck firmware from
   accumulating consecutive timeouts. ps_hang_cnt is reset on success
   and in rtw_core_start().

Changes in v5:
- In patch 3/3:
  - Drop redundant rtw_hci_type check in rtw_fw_recovery(); the check in
    rtw_fw_leave_lps_check() and the existing PCI-only callers already
    guarantee non-PCI devices never invoke recovery.
  - Only increment ps_hang_cnt and trigger recovery when the firmware
    supports FW_FEATURE_LPS_C2H. On legacy chipsets without C2H support,
    clearing REG_TCR on failure causes subsequent register checks to pass
    immediately, resetting the counter and preventing stuck firmware
    from ever reaching the threshold.

Changes in v4:
- In patch 1/3: Also clear RTW_FLAG_RESTARTING in rtw_ops_start() if
  rtw_core_start() fails.
- Add patch 2/3: Prevent double free and sta_cnt underflow in
  rtw_sta_remove() when recovery races with station disconnect.
- In patch 3/3:
  - Keep rtw_fw_dump_dbg_info() in place on first failure.
  - Restrict firmware recovery invocation to PCIe devices to prevent
    scheduling while atomic panic on USB and SDIO.
  - Explicitly check rtw_hci_type() in rtw_fw_recovery().

Changes in v3:
- Note: v2 patch 1/2 (DMI quirk) is already applied in rtw-next.
- Add patch 1/2 to clear RTW_FLAG_RESTARTING in rtw_ops_stop()
  with Fixes tag.
- In patch 2/2:
  - Count consecutive failures before triggering recovery
    (RTW_PS_HANG_MAX_CNT = 3).
  - Reset ps_hang_cnt on successful LPS leave and in rtw_core_start().
  - Suppress raw register dump on transient failures to avoid log spam.

Changes in v2:
- Rebase on top of rtw-next.

Kalpesh Solanki (3):
  wifi: rtw88: clear RTW_FLAG_RESTARTING on stop and start failure
  wifi: rtw88: skip already reset station in rtw_sta_remove()
  wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS
    leave failures on PCI

 drivers/net/wireless/realtek/rtw88/mac80211.c | 3 +++
 drivers/net/wireless/realtek/rtw88/main.c     | 7 +++++++
 drivers/net/wireless/realtek/rtw88/main.h     | 1 +
 drivers/net/wireless/realtek/rtw88/ps.c       | 9 +++++++++
 drivers/net/wireless/realtek/rtw88/ps.h       | 1 +
 5 files changed, 21 insertions(+)

-- 
2.53.0

