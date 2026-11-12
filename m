Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489230;
	b=evUTpB4RTlh4yNO/NOk+xsFo+g0UJqmzk3RN4YJqQ1SJJScqrwHgDaRgP2xaCZGZmvg1
	 NLDfh9kkD7FriZbPdt8ASe89KqPFYi30elW/10gOPdHLg+4HP4xbvEWR7sZ9a1AGqxYsR
	 JyFcm7AUZWP1o00nn47XxiEr5H822PK2yilrR5Rq7YvDOUh8XNPl1C2zlW16tQ5kGfPrm
	 qZIKr4AMGlK9N75m0SMGZU7Kq0Qj8ei2Og/YSYCjnUFTIto379QLSPvkrePZ4ivqIMgdN
	 ZOwSxJnUwUZJOkS5noRMMG4SBte0Y/KUWzCTyhDoMhNnDKS2vMaUKk8ZuE8+iz/2Tlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YU2hXqNmb7fbPgUZsnx7SG8vtJgeywnopM9Jcb/ViNQ=;
	b=gQd36VZeNxlCfDHidS2rA/Srd/4eom6KcW7QMFHb1c63Z/9cdJwCPlpUG69giFVc3x/T
	 Grz7N8QgkOz2pd3uxPzn7iHeO0ybGr527+4LWakyhIAJZPi3R9jE63ZEtlpSsk9Zfxd0A
	 S7DQDVvn2KseUJJwrNDdekYJKfYpK+fBsbdJOaaJQBjgbN2lWLF6LZjX86+0x4f8vHvPh
	 GexSWHNBz4DZ+NXYtVq4UyxTcFuimWAjVrkFAh1ZQSwyigd5HBSmK2upfn5KGoD0zjvXP
	 qAHjRIHfBOcvX8BZHUTItF4Jzbiwxjr9NXJGv+u/JoCvHKvtzTILY8HxX9DfjkSrkKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZgHRT+X;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242FB606A8A7
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242FB606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GZgHRT+X
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so8079470c88.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 05:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489229; x=1795094029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YU2hXqNmb7fbPgUZsnx7SG8vtJgeywnopM9Jcb/ViNQ=;
        b=GZgHRT+X+rRD6nJNeLPBXmBFnvmTUF8oOhPGSuiY9nhuowlhO+3lXFG2u8P5HVRjsG
         HhIqZYyyXJkHFYybB3oWHoE5dEKCNDD+fwMPgrWZ/l+Ojp7aN1mILNj+58vs2XPbehzw
         CC4yVbZu0so4a6X5bskKFY9zuXpRcZRUmuJ3xyXS11FPqV6IwNK94ybkig3W0dZlzPGp
         EKjz4aNaJZiYVzCd3qtjhGfD1XXLZ0tL8aFiIpEE/3fWWkUvOqv/pk6zyKpkQvAOZHoR
         nloj4v48d+i8yOIqmXrTzNb26lTTPSfZeBLxsvc4ileeb7zAmaH2lv+dB4wCcQu4qoST
         eX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489229; x=1795094029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YU2hXqNmb7fbPgUZsnx7SG8vtJgeywnopM9Jcb/ViNQ=;
        b=fFEOdQE6JFDHEV709WUdzjXor2oKprnIEe5lRMd3kbrZj5DakzOnPxAXt4yTNb5DXX
         I35oQm+vJBdUc5POrmrFXjXh0rqO+P3asV1Hx0xDzyIuRaWu+mD5p8yLP8Fgn0GEqMMe
         wScrrE4Gnx+zKv1u1RPLeLsh9WvaYHa261Z7hWgIZ03nf2T035tLy4APJodffJhaElOe
         2v6HHn1XbzkAOydMz2a+xx7wXiaXHBp08ryznbRETkF3rZo5SJErfjPZwBNuN17RMa9t
         6VeVkbB35fVkRfOe3r8jxmNaRXILPf1GVE+k2hhwhF1QQsxuv8YWY3o6OcsRTTNS7Clq
         XnyA==
X-Forwarded-Encrypted: i=1; AL+hErFFCx3l4gCKV2LAkr7bogtNdhv+6FAgI+5cZQM/KWgzkzbiTgpWlRh1InQu/dD2TkzkvC//Zq0H2/A8FwI82A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LbUaiXPiDbiGZcx9Bvrcjm0ved0JcA7Lswj76Ckeqv+0ETEAs
	/yClSqLGWU08RIv12gCBwfPnKffL3JmBBoriGYISfbOCWhXPzL9FDXru
X-Gm-Gg: AYBFou1gTZnh8JkqH8o7u1exVFdxluVikTyVMhw1nyFNQT26yOs6Hfz6sglPncPgIl0
	EnuNXanzghVxEkSouFXP6yoLqIdNWeEiwRMkPLjdiaxE6TQHwVxL5DFNa6BV7x8yyCLt7SIkDmr
	3mqWRz8IHk+z7LZUqX31mUdwxcWGZDygIH3Ogi3Py8VP6XF8nwcuUun2P3znXXm9Ap0mRRrc2H7
	7O/4l8dNSNBmYJYOtecn6nVbxP7WvC3IHydQ+WcDsgJnCBZ/szcKd8V8GEng3ouWOpI7wjeVlpT
	Z7gNynVyJtiR/pno0S1qnjJ4+URxMV0CFLtN+jfJEY+MV2wU613MzwBBwKKZCT/DFm+X+O5Fe56
	hIRjnXyZbJgFbEZ4AyFALz2p3GJjCRYKuRkxM70h7Aqmj0fnXKE0vShhvbd6KJ96lXMy9utuBKk
	OkkOBBHHwBuszlBSRLbq2ftzKSshe2s7TU1+VPXFo1Z65XszHELKBog3lS8kQgpjCCgUmGOoWCw
	iqMEOjg3IC9/6+SJ2qcaBo9tSg4FF0QsRCQwMyOtKIE0BvuMKaWrRfNUPUfNvLwuTFlN7cUxUCo
	6p8YzFWkvXHDTxZWo/pNUQ==
X-Received: by 2002:a05:7022:ea56:10b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b3c032e676mr5378970c88.25.1794489229103;
        Thu, 12 Nov 2026 05:13:49 -0800 (PST)
Received: from xploitoverload ([2a09:bac1:36a0:120::1c5:160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm25449363c88.2.2026.11.12.05.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:13:48 -0800 (PST)
From: Kalpesh Solanki <skalpesh942@gmail.com>
To: luka.gejak@linux.dev,
	pkshih@realtek.com
Cc: kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalpesh Solanki <skalpesh942@gmail.com>
Subject: Re: [PATCH v4 3/3] wifi: rtw88: ps: trigger firmware recovery only after consecutive LPS leave failures on PCI
Date: Thu, 12 Nov 2026 18:43:29 +0530
Message-ID: <20261112131329.236152-1-skalpesh942@gmail.com>
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

Hi Luka, Ping-Ke,

Thank you both for your patience while I was away, and thank you Luka for
advocating to address the review feedback before pushing v5.

Regarding Luka's two comments on v4:

1. Redundant rtw_hci_type check in rtw_fw_recovery():
   You are completely right. Since rtw_fw_leave_lps_check() already guards the
   call with rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE, and the other callers in
   pci.c are PCI-only, having an HCI check in rtw_fw_recovery() in main.c is
   redundant. I have dropped it in v5.

2. ps_hang_cnt on non-FW_FEATURE_LPS_C2H chipsets:
   Excellent catch! On chipsets without FW_FEATURE_LPS_C2H (such as RTL8822B
   and RTL8723D), the check falls back to polling REG_TCR for
   BIT_PWRMGT_HWDATA_EN. On timeout, the driver forcefully clears this bit via
   rtw_write32_clr(rtwdev, REG_TCR, BIT_PWRMGT_HWDATA_EN) so packets can continue
   to be transmitted. If the firmware is frozen, it will never re-assert this
   bit. On the next check, the register read sees the bit cleared, falsely reports
   success, and resets ps_hang_cnt back to 0. Thus, a stuck firmware on these
   chips could never reach RTW_PS_HANG_MAX_CNT.

   In v5, I have updated patch 3/3 so that ps_hang_cnt is only incremented and
   evaluated when FW_FEATURE_LPS_C2H is supported:
   
       if (rtw_fw_feature_check(fw, FW_FEATURE_LPS_C2H) &&
           rtw_hci_type(rtwdev) == RTW_HCI_TYPE_PCIE) {
               rtwdev->ps_hang_cnt++;
               if (rtwdev->ps_hang_cnt >= RTW_PS_HANG_MAX_CNT)
                       rtw_fw_recovery(rtwdev);
       }

   For C2H-capable devices (such as RTL8822C and RTL8821C), completion signaling
   reliably accumulates consecutive timeouts when the firmware hangs, while
   legacy chipsets without C2H retain the upstream behavior (clear TCR and warn)
   without getting trapped in a broken counter reset loop.

Regarding lore / patchwork:
It appears v4 was either dropped by list filters or delayed during list delivery.
I have sent out the full v5 series [PATCH v5 0/3] incorporating all the above
changes to the mailing list.

Thanks,
Kalpesh
