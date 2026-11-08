Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148060;
	b=rcHBkuW9JPlpeXL8rjF1jpaS+on/dHyIFE7Sju4IYepFDN83WzOIXp2UouBDhoZUCSnV
	 rp+OWImWxtpEHjmEPhr/qSBDJaFT52azQNi46nVYIkSEWumxcYDUpY5CHoF87qP6m1K/V
	 H4WHEAU8AddFwHa5LjaSjG02LEUy7DfCs9tWwZZVqkvHGACOZ91pbd7s5zw2p1h+6Ep/0
	 yToBQ7+jhSpAw0rOBr6DU0nKAgyALzCB22ExFvmwzt+UdEelxjeXsGdkGLhMichPe35PY
	 FdBsL7fFmXeCi3KPKY1zd21be+2V2O89qGb1igehvzxobUeUCNRRV69LH1Vcotwc9GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FeecHu+rLKVEegyuyks05yugz3s85FhQ5MVmQrwNtxU=;
	b=JF6s1ULD8zHfbzYuAdtK75yuFsf9qT9NfWp/SKzyPoiiZq3rVyHqlaJKG6t7X9/S7ZwG
	 6KCglzGDtEQPiG4pAZUQ30ahu6VHKghHgoNYs3g4jRXnyYteyg4eMngMQVVf91ARG9PS3
	 opILRtV8xlXDAZWKLqqnbk8MjRbNX46Pk3sUwSRwA/fGgFyfcR7rCWJf/fzisvbJ9PCzB
	 w1dzLy44Eyi5A4uHHV7OtXAMDhXjo8QW5zVC8wPqGCxF3wBnwzOo6vmpNMQdXu/Arq8pG
	 KWrngIYwUl913M/PxBDnNB+Oi4KUtq9EvQIoBey9j9O6tAOZZazwviWZ/TrSJzyhKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pw+86qYV;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B0E606A326
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 14:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B0E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pw+86qYV
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37071c0f42aso264221eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 06:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794148059; x=1794752859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeecHu+rLKVEegyuyks05yugz3s85FhQ5MVmQrwNtxU=;
        b=Pw+86qYVL6ZYiCa+di+yx2rGTTmDNlnSaABoAzZ69FcSeLHm7Z1ynsGftyBN29mqt+
         qrX5udDjlr4yiXmlhuhqWfqbiTM7jGn7ib8naL05KZR+mOuSGQtU9FcFTJxPtsktROBw
         3UTIMLjcLyhCAMCoV/uj8aXzvjcfT1fITW3Vcg0jYmlrGPQKCsO3ZdmeNdJCmVd/26Qh
         rVdyCCpqo3eZ/EJM17vuQNdO0D0Lf2mzJSH5QyGN+KBQEzyPAyJZjr44GGwAdrGiuD7F
         3u8ibUqLMDyNq053Sq/dfkzozGbUD3H6pUEwmayawQ7be1OnYCwe3gv5VLNdbKbeEqRo
         94xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148059; x=1794752859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeecHu+rLKVEegyuyks05yugz3s85FhQ5MVmQrwNtxU=;
        b=X8gI0rOOATrIFfaxd2f3ek6uV8jKGQ1M6XrPBuukk1YQItxMHnthX7mcOEmWLhsWJD
         Q8sCX7pSlq+uxe4AgVpQ3BjY8LBCKiKJKNRlFgto3ddWIkBYxSgTjl1E/FL0fwfF62k8
         izc8Br6JsK15Z3WgAlMQYt9iHM6MebSrdE7OxwD3xT5XVGcEVIjMgmjNOvserBmA95Y8
         7Eph3lhOzh9BUklsCmRnL24B4A6w/2qiE7oEBj6q6vI5TO6+0++r2nX0j70U6bkpY5ph
         TLcLYdJMW+pqziAWI+u8C8iKAdZsu7Z7Yl7fQYlf3XSnBrhuhlYjBEK2RM03xDdbT7Vy
         DjCg==
X-Forwarded-Encrypted: i=1; AL+hErGe4hUbQLXA9rPg/nzf0GS7f8tx5UdJcLGMThnxAfygiNwcVHVZZvWt6F4B43TzD2tk8TpfVBq2HFxsJhZXMw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9qLwLRsreOOU+PC3aLRUWoa+pEWyhoLBAtZ2asUeI9o2H1h/Hl
	Ig2GB452FS9GSQgv8Max+qKO9ms7Q/NNy3PuZCUykCYygqXosoAkV1jJ
X-Gm-Gg: AYBFou0QD25T/LXykPj8TJSvYY5yXCovIyw5daoZF9U4wn+Rld/+j2B4yJnJwOIMZB3
	1VjnNRigqYId7XWCc7785TMqvoaOxNvYd+iarM4iMnNkZwbX8uKRmIaM4x+6i6R45TnWxEQP6wc
	9rhXw/0KLcdJevU0Tm0uGFifjjQxggCDPLnduFGp6H7W2B16si1X86hLNpuaLEmmm02fnCVWB+Q
	vQIqLN4/Syv12nD2BsrEP1VyEziwRxzASgKbb1JHbGECps/gLUttF6s1REeG/iwcCFa5rYl8L/0
	frM34D+E3fKY6lGyKACbVUBfJV1iu0WlLe8zvYM7K06cmQzUhHUjC6DiF9d/20ZDvOzah+a+wvK
	ctn/VyoEBxRbZfyRhBTBG5M0HV9I7sJh54hAxtUBaa7GBG35Ocu4SRG3X2XFX2sak3jjw++y91r
	JbiOClOjfAgbJMVHDMn1124n03ha2z3MPGGg4HlCvO67qKbUpL9j4pecODbtnSk7T5BzpB0UTy0
	qUMzy9yGTB5AcDpFcvBiYSzEu4cJOFdIjCPpQTUTMUtS5f1EHfJPpMX3RNd2auQ+QrLiBC6fi4i
	3vgBe6azcLoCVXfy9xabX0FkfRKoa7BRn6WO4MSJpSihlYVYpP7NRqc9q7i0
X-Received: by 2002:a05:7022:7f0d:b0:18a:8164:ce4 with SMTP id a92af1059eb24-1b39fdada62mr2279989c88.0.1794148059417;
        Sun, 08 Nov 2026 06:27:39 -0800 (PST)
Received: from xploitoverload ([2409:40c1:6412:e5b:5516:cd42:6c8f:c918])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm7141347c88.10.2026.11.08.06.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:27:38 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: pkshih@realtek.com,
	luka.gejak@linux.dev
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: [PATCH v4 0/3] wifi: rtw88: firmware recovery fixes and LPS hang handling
Date: Sun,  8 Nov 2026 19:57:04 +0530
Message-ID: <20261108142708.489067-1-skalpesh942@gmail.com>
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

This v4 series splits the recovery fixes into three focused patches:

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
   triggering hardware recovery. ps_hang_cnt is reset on success and in
   rtw_core_start().

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

 drivers/net/wireless/realtek/rtw88/mac80211.c |  3 +++
 drivers/net/wireless/realtek/rtw88/main.c     | 10 ++++++++++
 drivers/net/wireless/realtek/rtw88/main.h     |  1 +
 drivers/net/wireless/realtek/rtw88/ps.c       |  7 +++++++
 drivers/net/wireless/realtek/rtw88/ps.h       |  1 +
 5 files changed, 22 insertions(+)

-- 
2.53.0
