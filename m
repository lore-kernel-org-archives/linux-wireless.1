Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759976;
	b=GXAW6BNDlefIEFSHrUFrEE1HI2oETDOJVOBLmtDGvPGOkmiDYOVmsCUdsK02K/0gastB
	 lNovzv871dTvkb5ZagpJz30MrYRSOIqWNkgS28bLhIxR+4mTP/Z30LJWohGAyPqYdECWL
	 GaGxhZnWGqCJjz8KYTGHJdgwBasCWOxidp4g1T8elv+DXxnv0d1ITHpZPvIUD7v13NyIl
	 ksfyjj1fDOD6C/LZC79KNloTvEQ8OSveGhnXBFSuf7d0vuPNVxOHYSNs+OauHQToBktgk
	 1aqoFPdLijhcsyAjmoBNg0hl+cNUk/dIEz/Z4PInrOXutEg7NYg2BvAYhjKXTbvSg3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jKbMVWTEY/YfvqqDd7MNrskixYQs06C/5wtffZ5UBTM=;
	b=NZG3+5MHwIOL5GnmLgadSJT6NRpOWBPQ5QyVRMnwgc4Z/Chxvv46EA+MDfr674+zVXQd
	 O9R8aPh2Cojqj8qfGDgQON74RrG19hvesRM2QmLaky+emr25ULJ5lv7YTqs7ZxBVCqSE2
	 Fj/09ZV3GHwnOXzehJg8GdbrfQFmeB5kCgMimqFYI0VcOkK1f5TDrXXhmHs5yKyp/jvM/
	 2LwcwQwzYQwelY0+BRYiqMDblYjLv3W1hBAsy0O+LEpm9xLuTALPLr0YsVaBvDfZtZGPJ
	 wPG5DyUMcGFeXjW72wHEEWYdYi4+6D7NqrRU2VNPSKBeGJ7/jc/I6WiYzTKGpvF2j7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RitUKgiD;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF89606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF89606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RitUKgiD
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15ea896ddc8so12698258c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 22:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759975; x=1796364775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jKbMVWTEY/YfvqqDd7MNrskixYQs06C/5wtffZ5UBTM=;
        b=RitUKgiD9UevuzK3GsHAvzZl6RQw1ZRoK51y7WRnB8YkCNY9VKGYWULr4wDsPRTyDB
         Pdgw8RAdM+T/Lp7PiQtNFHfAZH7Bn7zS0o+hjXJw3ueTkZsfK5NdEGblHThSf9D9Wnub
         D5IVxU1plbsu/lTRvJ/8RAVR+VfnrCofg1ptidzucaiQJOyuaU/Se+3p/+xfHZWTnKV1
         XfFJVJQV72hP2hWJY3xaKDrv+PABYBi3C72zuQoZaySvWDxu4BdtswUJ9+oVR+plF8V7
         Zsch5vSLEEoAOfEqtt+l3IyFkp/69/0ruONvj8y0UYLyha5dhAD6lJK8mldoHBw/F9Af
         TWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759975; x=1796364775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jKbMVWTEY/YfvqqDd7MNrskixYQs06C/5wtffZ5UBTM=;
        b=veb/L/XyruaLQuVTGOBOJnrV06518Q2+YqmI56HP9JeqCXqKTrl6HhysjY+g8jGuaz
         r2I3knoEAkxl/bXXGoTqNGj/2jfoJ2+5wGKVYKv0sXp9wyMAjHwIMENuRee2CfXmY5bQ
         1DlbQTqdOK2FA/2B4Ov/ubW6MfsjMP1Yr9UhgFsxJpgZ1ysplQnYagBBtOQGBya8kuAk
         3JdXFna0dofrioZpHK19TlLcq2Evl8Ea2EQmQmnCSGdFHd8Uugwx0sVwDqQFJJZ//lgB
         /LogYHFcxY5d38KaMd/p/HuhZ2MYJn02QqRNDrJRgK5QXO9Cfb7sNy1czF8RS9PwBArI
         yoew==
X-Gm-Message-State: APuU4Z+w/L0K78hTZkOZgJRSQQFGyZoa14Wx/M02OAJC/bnR4yaIzCs0
	aI8Yhk9TJkTfUUow5e7rsjFEhsBP6lykuwwkVv+rWt52JWa0pwbseE+hOaF8L2ma
X-Gm-Gg: AZFdTZc2D1wd8vVvZxVS6RRBcosFAR+ewacg8R1kFFxdBEvcKdbC2erylCn4rRBtj1W
	1b+n+RQAbb7s8dd9WrKyBl5ljdSHhLWXnbXzreXuvgEC48VYZLW+UviF8BzRazMvT9LQIKEvoKQ
	vtSDpeO0ljuXUYi0vOusK1SPMRdDlL6dpDwpaUe/pgCTK0Nv0guqpgMVzZa59pZZm3pOZ82I+8+
	pYVWsHE1jcCa16n+pq7KdBHvP1NYWtaIeT5DS9jvgIPCCM/ZxavgasSZDuocXkXRbYxBbKIsJDp
	czCpmyoPFd0D1hMaBXa1wYSEd2XXg/f18urbH/lmSutx9J2s9wWCjUblRZ5CE1Yc7Su5KacAB5C
	tWhz2cjaFkBtwSHdf+wwcEmLhzzCPYsqgcZcSlmQXPXH+FA+bdRsXxGWN6lPCZuJSeilxu/plt0
	uNTCaAWocLo0o3qakyLFDYYs4XZTbADUYjKuthhPFQULj4nvGKA6aJP4EECI0NO7ZYnsNUXxYmi
	mKsj4E/fx5WNeHy43OuLD82JSmesv186ElYx0H8m4CFAVhEjQ6CNXpH7ktnQu+SmAe111yslblT
	PLWf04QZ6nx/jQ2KsfkHPGHUuamnngrSb9vhBp2EblK7Sr6QrSA+bM1vgNzgm0G/5LAKtw==
X-Received: by 2002:a05:7301:6408:b0:36a:270:ce76 with SMTP id 5a478bee46e88-38570f2b27dmr23879947eec.33.1795759975049;
        Thu, 26 Nov 2026 22:12:55 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:12:54 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>
Subject: [PATCH wireless-next v2 00/11] wifi: prepare shared code for brcmbmac
Date: Fri, 27 Nov 2026 14:11:30 +0800
Message-ID: <20261127061147.506129-1-ragulbaby@gmail.com>
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

These patches move brcmsmac's d11 core definitions, its rate, PLCP,
frame timing and RTS rate helpers, and its channel and rate tables to
the shared brcm80211 directories, so that the brcmbmac driver for the
BCM4323x USB adapters, sent separately, can share them instead of
copying them:

The last patch moves brcmfmac's USB bootloader definitions to a shared
header.

Apart from patch 5, these patches change no behaviour.
Compile-tested only for brcmsmac and brcmfmac.

Changelog v2:
- Move brcmfmac changes here too.

Ragul Balaji (11):
  wifi: brcmsmac: make d11.h self-contained
  wifi: brcm80211: move d11.h to the shared include directory
  wifi: brcmsmac: look up OFDM rates in rate.c
  wifi: brcmsmac: give the rate tables and helpers a brcmu_ prefix
  wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
  wifi: brcmsmac: pass the band to the PLCP and frame timing helpers
  wifi: brcmsmac: move the PLCP and frame timing helpers to rate.c
  wifi: brcmsmac: move the RTS rate selection to rate.c
  wifi: brcm80211: move the rate helpers of brcmsmac to brcmutil
  wifi: brcm80211: move the channel and rate tables of brcmsmac to
    brcmutil
  wifi: brcm80211: move the USB bootloader definitions to a shared
    header

 .../broadcom/brcm80211/brcmfmac/usb.c         |   68 +-
 .../broadcom/brcm80211/brcmsmac/Makefile      |    1 -
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |   34 +-
 .../broadcom/brcm80211/brcmsmac/dma.h         |   27 -
 .../broadcom/brcm80211/brcmsmac/mac80211_if.c |  153 +--
 .../broadcom/brcm80211/brcmsmac/mac80211_if.h |    9 +-
 .../broadcom/brcm80211/brcmsmac/main.c        |  741 ++----------
 .../broadcom/brcm80211/brcmsmac/main.h        |   26 +-
 .../broadcom/brcm80211/brcmsmac/phy/phy_cmn.c |   17 -
 .../broadcom/brcm80211/brcmsmac/phy/phy_hal.h |    3 +-
 .../broadcom/brcm80211/brcmsmac/pub.h         |   35 +-
 .../broadcom/brcm80211/brcmsmac/rate.c        |  514 --------
 .../broadcom/brcm80211/brcmsmac/stf.c         |    4 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |    2 +-
 .../broadcom/brcm80211/brcmutil/band.c        |  140 +++
 .../broadcom/brcm80211/brcmutil/rate.c        | 1077 +++++++++++++++++
 .../broadcom/brcm80211/include/brcm_usb_rdl.h |   78 ++
 .../broadcom/brcm80211/include/brcmu_band.h   |   26 +
 .../{brcmsmac/rate.h => include/brcmu_rate.h} |  170 ++-
 .../brcm80211/{brcmsmac => include}/d11.h     |   43 +-
 20 files changed, 1637 insertions(+), 1531 deletions(-)
 delete mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmsmac/rate.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/band.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmutil/rate.c
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcm_usb_rdl.h
 create mode 100644 drivers/net/wireless/broadcom/brcm80211/include/brcmu_band.h
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac/rate.h => include/brcmu_rate.h} (51%)
 rename drivers/net/wireless/broadcom/brcm80211/{brcmsmac => include}/d11.h (97%)


base-commit: 3c311bf321442d4c4f452a1a08bc9efce242a1f9
-- 
2.53.0

