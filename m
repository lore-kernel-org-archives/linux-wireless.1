Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336252;
	b=zroJAG1u5+eOtOZ4eApFHfUmR+EpmuIXHvD298M7W1V1OYPSwRhcgtejVvWSut39Omjo
	 aaz1nI1OEKw0IVae/ZRN70vQeq6Wt7Rp/f3HjF0vLe+yYin88cZhIneecyPAIdp3dET9o
	 ncu0zNmHeqlNpQR99Tbv88zUnwaV8ynnAxXTPNHntxYrhJK1xd0RGjwUZflUQk8oit6IU
	 /4UdqFmUMTSn2MFX5o7U+yygKa4Fus+/XS2x79zh93FCUSnV8O/DPQiVVF6POWTfRw/DK
	 c4JwluIag3jMT3vo9qi+IIi9msJzLCKWD43BtNPj6AjDMfPp4TIy4rJ4kSnHRl7tyFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/MHAqmpZVDf3RuRGxKwN/uRcmtCFuVXbXAFmMCLLjBg=;
	b=0dkwIlaCfmN/B7E4sM13eCzps5R4LBzizbqun2o2jnlD+pyJQ/itI8jGtu2fFkMlD9v2
	 5SJ1PxiCEvuGK596G7NQokfTMOpX2Ug+VuuRosd4EzsCMXIdy3pCn98y94VhKWwIk7QB5
	 lOA/xFd77mhVNoivvoCw+O8d8vlIt/j4pi4wY85jxWXzpi/cJAXCWD/5uVazXO4uV4jlK
	 /NVIuADMbC74UjD3/6Ui9cimukU/NQvW2DsznzQXv3S65vq/5gjAJgv2fqx/Ke9mI2u4E
	 pjPtHn7n+X0vu9OHwG2NAGrpCJzUCjD/eKP9npzChXbR6R2k8TJTZ2xCRIdOCTEq9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qf7j0Rpr;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E053606A320
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 18:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E053606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qf7j0Rpr
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85a6c747dc9so1544192a34.0
        for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 10:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794336251; x=1794941051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/MHAqmpZVDf3RuRGxKwN/uRcmtCFuVXbXAFmMCLLjBg=;
        b=qf7j0Rprohyj67NfIPCudq7EmO4QjBIsOLiTyQwe9jBzpBIszrcjdygCpFZQecpGiW
         E/VPoS+58sjZTnaEPm4wNSASOQK9jpb/yIeZTFhDi0jEnAwhIlEdzBYNlMby1mKek4fi
         OY8iNRcoZC6HXemV21UtkYFi1fPood4ti+v6X51dK9XA4QYNgF5ngm/Ik2jGt27J+Yug
         S7cGWLJS3JODOE5iWggWDSHqtbFM1V+8CKA7+6nfyak7SZn0I78T9SYEFTi69zjYggRQ
         fjgzU77Hi6z2Y/uKIYL7OXNx1hJkh7uHdigOZI7RSK+2N69ekFFbWIK/HoPGbml/3YMV
         bw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336251; x=1794941051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/MHAqmpZVDf3RuRGxKwN/uRcmtCFuVXbXAFmMCLLjBg=;
        b=ydw2NWoy9j8lmClpmS5eL3BhjYc4lu2FIiyngJr1lh608vZZ9983Y2mFyhSMv5HTsk
         a2KpqSZeEXXzro+wz3R48jUEi1UdgcXx+mMRI/glJn8h8+g11H21bzbmkXTlg72EmbQ8
         auNDYgazaw6D52IaAAbyH0VWal+z9SnRdTFyMw5WusC87RXmahmYhIMryV34ZpSDMu2k
         0VO5xyq3j6wA7dhklb94nfWWaCRfbP4qTvgtq8soZdm1dalm6vxrYccY8iNFNB3Cpwg3
         vKJWN7Ggqbdj83vfVPWWcshuktzvoQmLBDhJPzyUIf1cZL+zSLLYgetwybk/FHuuwmzz
         TUWg==
X-Gm-Message-State: APuU4Z9rQH6QcmHFM7lQC21P1iifS5V8kkLlefL/PxvSGr7p4SpQl6L3
	rSOm27AoTiwiv2GEvHDEJYxDJzHY9dFg8keUGbTREIZ4YI9JL10vGF20JWyyDyE53o0=
X-Gm-Gg: AYBFou31GcStjhsbm2MiH+zW7gBEgJuALs8/u7pweqF2tVOC+ldkhkqFLKlYr4GfSM1
	zrBJ+ZxBO/CTNJMW9rn4zI7/JwtBxQSUQWdk9XFMqnc+dhvcbkHtGKLuy5QmyZ+qE214NqY1QI6
	nb7G55OBy+QwDhJTmwR/7E/mebobZsBTSuxfDVzFiT2lQQDRzFuN9a1T0qC4UgJIUuZPcFLWq7l
	/UFDIS0IQDjP0QZZT07qcztPxhEMVeBpdmFk7MOPxX9C5j7sKY0uSwm3K3qW/dfVbcjmY1vsizJ
	FtWNjg5e3Y70ayswcnQfQys5AE2E4bHMHY4b9vAFDh3sP1wVJz3XPZ+Nu/bCExyoLIAeCjA4DME
	cRs31Ipl0LK4/6JGR4GHWulSuMTrp7lpByhQ6antLrfkc9i7H26SVLFGfQfGvZxijI7sg/ED90D
	JRVNst7vZgFIxm29Pa16L5m8hlC1Hh7FlINLhNyur0DcCr3iKM6g3SWUB+T5mdosk7c5lq+p3Ox
	JssR0AKY38Dk1dQ8/fE+Q+tifm90/m5qDbHtG4UVhS3dzRGltPfO5HWYQaOkmV3AEcXAqNm1xjh
	5rtDVZF31a1ypdFHDUTCviYUMgpy93xxpQ==
X-Received: by 2002:a05:6820:f014:b0:719:1627:6c16 with SMTP id 006d021491bc7-71916277259mr109766eaf.12.1794336251088;
        Tue, 10 Nov 2026 10:44:11 -0800 (PST)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f660b2sm2225776eaf.4.2026.11.10.10.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:44:10 -0800 (PST)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH rtw-next 0/6] wifi: rtlwifi: replace the 802.11 header helper macros with kernel ones
Date: Tue, 10 Nov 2026 12:44:03 -0600
Message-ID: <20261110184409.42205-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
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

base.h and wifi.h carry a few helper macros that duplicate things the
kernel already provides. The reserved page builders in the fw.c files
write MAC addresses and the PS Poll AID into their frame templates at
hand counted byte offsets, there is a private alias for
msecs_to_jiffies(), a private rounding macro and a private frame type
test. Some more are defined but not used anywhere.

This series switches each of them over to the kernel equivalent and
then removes the macro.

Patch 1 uses struct ieee80211_pspoll for the PS Poll template. Its aid
member is __le16, so this one is more than a cleanup on big endian
hosts, where the old macro stored the AID in host byte order. On little
endian hosts the bytes written are the same as before.

Patch 2 uses struct ieee80211_hdr and ether_addr_copy() for the other
templates and removes CP_MACADDR() and the FRAME_OFFSET_* constants.

Patches 3 to 5 replace MSECS(), N_BYTE_ALIGMENT() and WLAN_FC_GET_TYPE()
with msecs_to_jiffies(), ALIGN() and ieee80211_is_ctl().

Patch 6 open codes the one use of byte() and removes it together with
two macros that have no users left.

Each patch builds cleanly with W=1 and sparse. I do not have any of
these chips, so this is compile tested only.

Rishik Yechuri (6):
  wifi: rtlwifi: use struct ieee80211_pspoll for the PS Poll reserved
    page
  wifi: rtlwifi: use struct ieee80211_hdr for the reserved page headers
  wifi: rtlwifi: call msecs_to_jiffies() directly
  wifi: rtlwifi: rtl8192se: use ALIGN() for the H2C command length
  wifi: rtlwifi: use ieee80211_is_ctl() instead of WLAN_FC_GET_TYPE()
  wifi: rtlwifi: remove byte(), packet_get_type() and
    FILL_OCTET_STRING()

 drivers/net/wireless/realtek/rtlwifi/base.c   |   2 +-
 drivers/net/wireless/realtek/rtlwifi/base.h   |  21 ----
 drivers/net/wireless/realtek/rtlwifi/core.c   |   2 +-
 drivers/net/wireless/realtek/rtlwifi/ps.c     |   6 +-
 .../wireless/realtek/rtlwifi/rtl8188ee/dm.c   |   2 +-
 .../wireless/realtek/rtlwifi/rtl8188ee/fw.c   |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8188ee/hw.c   |   6 +-
 .../realtek/rtlwifi/rtl8192c/fw_common.c      |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8192ce/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8192cu/mac.c  |   5 +-
 .../realtek/rtlwifi/rtl8192d/trx_common.c     |   5 +-
 .../wireless/realtek/rtlwifi/rtl8192de/fw.c   |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8192ee/fw.c   |  58 ++++-----
 .../wireless/realtek/rtlwifi/rtl8192ee/hw.c   |   6 +-
 .../wireless/realtek/rtlwifi/rtl8192se/fw.c   |   6 +-
 .../wireless/realtek/rtlwifi/rtl8192se/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8723ae/fw.c   |  38 +++---
 .../wireless/realtek/rtlwifi/rtl8723ae/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8723be/fw.c   |  58 ++++-----
 .../wireless/realtek/rtlwifi/rtl8723be/hw.c   |   6 +-
 .../wireless/realtek/rtlwifi/rtl8723be/trx.c  |   5 +-
 .../wireless/realtek/rtlwifi/rtl8821ae/fw.c   | 116 +++++++++---------
 .../wireless/realtek/rtlwifi/rtl8821ae/hw.c   |   6 +-
 drivers/net/wireless/realtek/rtlwifi/wifi.h   |  30 -----
 24 files changed, 225 insertions(+), 282 deletions(-)

-- 
2.43.0

