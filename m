Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795278864;
	b=CjXttaQ9bL+LXzoRwUjIP0itj5d7NiwE1HTkVqxgHz6ku5xmdfoGgz81NPgBNR7ufsk7
	 edZT1+EsuzsiLJNJ2wZ+bEc/jKOsZoWluN0nO4xeYgZ3ZZq+ma2/GtjqSlCxy8vz99UPV
	 4p1giserb9M5B97mjhphaE2771Kcd0V+RT4LqsRiNE+xf5n/+o6sPHo1AOuO1/unLZxPu
	 BWhVwe0KKrBA4lqp36YMHsEjeJz1UWjDYcSYRkTQfzL6bgMhAHNUMLuV8ro/bTNlgAdFI
	 vKBo0PSlspIlh28oRvw0SEdMLgb+BNM2mM9Pj+r/r8FWQ0h0bv2CGFcA+/3pBlfMG9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=Lz7tsmSYM0hUhccTl923sx6zcb3KnBzfEFLZA9i4GLI=;
	b=AmPNGLGv5bTHlpre6O95rMkKuvcs8MpXUe0MbuOQiZ26CKV9NG75cEl8Bub5/hAwWdF3
	 J9zSxDcuA6Lgq/vVDPvOTNAaS5LV0RFwzoJXfjQ0nNNYZfLOyaPUeDLSCt8+IsxlaV7w1
	 gspdGDI4lA/bS+pcranW/H7o2yeYimkC1jFiMEKJGPsUEXy/z2bDjh4LXc62qDV2gxWbi
	 fM0MYvm8QKI3qZKfz2tLKQaru08ehF+gc6s35WmWEsZASoRqTNB2EJ80BvcD2P+e2IDSc
	 8HgasF5x/Vpld44rO2IuILAL2f//1Pu31Iw0wSNyfisBx54qbSpmq6sMt0JqsV0Hv9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ds8uIXKh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D7606A320
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 16:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ds8uIXKh
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eae12762c9so771241e0c.1
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 08:34:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795278862; cv=none;
        d=google.com; s=arc-20260327;
        b=MpbryswSy1sRHCqETlQmI87iSQ4UhRZILGDMMlHDjrReX3nq22Q+SbGFoxV7Hmve9p
         j3pTnKWEgAgZk1a2VJODecDEfXxZ1++1X6jqIQg1AUWjmMl+N5LVO4GQ07gA0gOPnUkN
         61CNaDRhGJstupz8BnbmEKE8MR53IJD/OcgJ4yFS+ecWcw3yI/ZyT7r8HfHYLLtTBt2C
         5tjEaq0JlbwpPn5rcWGyjT4VwJiWaA3LE0pkZEfrlJgVlLrQfX8uKdKZWQfRe0cBUX1f
         5/5VfuKJC88gO2XKoicx3R4pBm07jANQ3OJzS3Si5MnzmtxGC18muyG0iKM2dP4mzIOg
         ic7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Lz7tsmSYM0hUhccTl923sx6zcb3KnBzfEFLZA9i4GLI=;
        fh=qW0phhq3fb3oiohK/Mu9j1KY1zyRNiiioKFc5anvatM=;
        b=rXH4upj5VJdk/k3KZ2+wb0UHywWRmBzeRpoDaV4DlNBwCYcEf+hdowf0fcFWX7zFTF
         EiO5r6XPO+4TOkLzvHfQbJB4IOx5CSTmEXs7jpiquuh8l32OCdX1Nd4Yq5JbgWbHf9YM
         vX3rSuQe0UBQfKSQnvDwjq9PkydEEPDyTRHve7UXxcxUIHp2OBo6sfdygzx/OLP0e6Uj
         E+nk0SvVewDHUEZVEu3LamyizNYWGwgAypaSHn/qYR7nQFVjuMyBkB684Pu34ssU4uwa
         cYhBYK3YWIV3q+HTvyv4RKlFkCyuuwWVUcGMFDldDJB0xJqiVI21twZjnu4XHi4v3EMU
         9GiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278862; x=1795883662; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Lz7tsmSYM0hUhccTl923sx6zcb3KnBzfEFLZA9i4GLI=;
        b=ds8uIXKhQiIIOwMu4FJWU/GNmjoDZXaDIkcKmHI3x7mCYKGBlVIKZpBnXZjPIfIDGj
         FznjsvS8Sz92Sw101sZVGnLCGyEVbJX/aVvEtO540Xeag+gUq3v8WMin9VESO2bdTrqY
         +hV7EFeI9uqs7V/SwjSFCieifzUIZSnNVbP8QAX57jP5M+ZtgqxxNCBL+bs2PHOkfIHF
         KagLCLI8MFD4VhaeFDyfJgqPBsY8eu8jRI9iCnwIxpGu5a3Mf5o4KuYAOnpADZkBGvbV
         Sr2JEaL/WkNo4UEJvBwNpSzZKBKnkej/z3eLakdLzvF1SnrJJ1D5Eei5vN1IwnKK802q
         0s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278862; x=1795883662;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lz7tsmSYM0hUhccTl923sx6zcb3KnBzfEFLZA9i4GLI=;
        b=a0esPKRmFSYRvy3jCeKFekgfLsDOu0SUiY/hlSHcp0ar/TJsbMK4f6VpYRlGKDbdfq
         pnpTryL2LvOoCQ8o0jztjyD34r6Dh1F+NxmqtdnlxHxesovHqTTfrUX862m5Ax153fHm
         jm6G+fqraiOltG93Z4AWP9Vcy+eDop3004rtGH046e1YpxoJxZu2sg6LnUAp/kDl2OTj
         +g7+VcbHu1eiKb1LzuR0CcZ36xG2rvRL6JAwHKyFXR7nMqMmkzPTamcdZ78GjO7O0x1w
         U5PC/9FVRzT6ctvBNMFA3pBifCPnuLDKdAo7Wh9oTbHnsOodt2ad3zrNGNsEfqADlM0c
         cTvg==
X-Gm-Message-State: APuU4Z/5mQjRqPLDIowVWzHMQ06W9J/rH9u/fiKSk/gBNtmeqqCKTpPD
	fej2hlMuuE8A5hBgUObnHtf2UXyx4v+PmHud0gwnxDVud/D3Qu1jsu/DxQ7i+qz/TelVyqNmMgG
	qjduHH/1e5PBH5W7C+kHjByFP4ZSg8sobHg==
X-Gm-Gg: AZFdTZe0X4e7YhWGTAk9qyJTVpWXvKZInfczEzMOty2HyXhHRyr9/ArNBMomQ6vZiwQ
	WPLTTltJc65vkmNiw9zCFWsfnm1q+yAuCh7xhCXl4v8qmn97tBmMBhOPNW+ppC99DFkMk2kwkZT
	hq2W759AzdG5CsctZiEh8Ai4nkBt64ZCR+s3KoRVutvhOx+SSislVWPwbIBiRVYAIYq6N0SOgU+
	Loxg8GbOWzYloiJTyHkU61ucYDIji/fkL7sSzEv4NtPfhV0eWXahZLUjs/QkpEa2QG+SlHRxnpX
	3EkdTtNf5yDbuTCpGaK+BC17amuTF0H8TR+EXkpR10nSJmbjwSEA8nG9pUeaRtKKRi7KOqVNbnF
	S4cOlLH2yoC/IGeK6z2wUod5S2uZPxaKNx1DJxX3d4ByubQvD5h28yS3M0zMOojMdUhIg/0tCSV
	p8S3ErZfMs/ipYHEfSdg9p9DeFY2rzV9nsOGhfZxHpl8k20gVayILamYF6bTs=
X-Received: by 2002:a05:6122:2226:b0:5ea:8e0c:1f8b with SMTP id
 71dfb90a1353d-5ee8aeaa9b5mr3157161e0c.5.1795278862502; Sat, 21 Nov 2026
 08:34:22 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 08:34:21 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NASEEM <nsmmjn1@gmail.com>
Date: Sat, 21 Nov 2026 08:34:21 -0800
X-Gm-Features: Aa3M54pKJsO3YdC46ZItXMsrySGFyZncL2QzPEtH6XuQLE_doYRn8p__j2sCJc4
Message-ID: <CANsZi5CvsogtJLoEOP+0+GjQAEr7UtFmaOv3pOCw0EhDncbJLA@mail.gmail.com>
Subject: [BUG] iwlwifi: Intel 8260 firmware crashes on Dell Latitude E5470
To: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Linux Wireless maintainers,

I'm reporting intermittent Wi-Fi disconnects on a Dell Latitude E5470
running Linux Mint 22.3 (Ubuntu 24.04 base). They can start shortly
after boot.

Adapter: Intel Wireless-AC 8260 [8086:24f3], rev 3a
Driver: iwlwifi/iwlmvm
Firmware: 36.c8e8e144.0 (8000C-36.ucode)

On 6.8.0-149-generic, the kernel journal logged 181 firmware crash
messages in one boot, beginning about 27 seconds after firmware load.
The adapter was removed and rediscovered during that boot. Crashes
also occurred on 7.0.0-42-generic and 7.0.0-43-generic. The installed
6.8.0-151-generic build remains unverified. Disabling NetworkManager
Wi-Fi power saving did not prevent recurrence.

Representative kernel messages:
iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x2000000.
iwlwifi 0000:02:00.0: Microcode SW error detected.  Restarting 0x82000000.

Is there a known workaround or an existing issue to follow? If further
diagnostics are needed, please let me know what to collect and how to
share a firmware dump privately.

Thanks,
Naseem
