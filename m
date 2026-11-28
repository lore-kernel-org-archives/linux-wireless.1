Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795849453;
	b=lajDus0nDepULxhO+lc4qUO693qMYmz5qKai4hWPSr/rQMlnBoy5xJQfIvwTzm5fhw+O
	 wy6aJxvzOx+Uoi4t5rUtXKSIm65uZG+OJJPgpOxgrclAITtJX5ULLgrm900ZjVidKebYs
	 XQWNdbPVQ3lMatQxJ6FnMH8JQbGpvyCEKFC+hX55s0FupjVzTUXV8/mL4uU8lWA5X3W+E
	 S4/MXSnmGLBeyVHQr4PWVDM00RsHxTDntjV25vslGVIjimM0gzkcjXGxwc4iHxqTkS72G
	 HqBt369/+ZkVjxNiSLAQ6jSWxOVlBk2um+v5Ytcq8HyEY7Ezcm2/XJXXvc+zYV+Sdiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795849453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5/KBdkImcIIENaeq362hNd97cFg9UT738kuOmRsIPZg=;
	b=L1HD5KpijbeLheiGLSYf1pOvZflKerSE7q7L+UxixpoQwcS/seOVX9l7OOQKucwECY+A
	 8uQNlnNwZvRt14NfUljtMTYRGO5lJG6aqFl9ZL7CTBIIVNGyhH6J8D02vaxWbxKO3SbG3
	 qwPfdrvo71YCZfTpaMghfvzzpYxltPZ0XU3zygNJQ/JqCsPndamMOpl0CSVGPwXyXpsR7
	 PmglabNy1rUwnYLMoTRq2F2eC8E7rIUn8jTMEAXMGiYzDWDKlImIaUwO4loHk2Adr8ydk
	 zpILGx6mF4obwzm4IFXrbtWUT4N17cCrqwyEn3N7L0PEXx2rbuSkjsohXz51zeCxJ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g2/94rJr";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165B1606A31C
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 165B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2/94rJr
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b563e5cbc3so1001142c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 23:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795849452; x=1796454252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/KBdkImcIIENaeq362hNd97cFg9UT738kuOmRsIPZg=;
        b=g2/94rJrJIL/aAzpvuIlo22CEcsKxkducYgaUaB4pDtpCvDYnrInOnx/PQJXIw4fSf
         nm+5e2zfdy3gMkRu4Cu+7xSLxv1iyWh4LqQV5LthBit9peO7/5Js0o4vFWT4faS2m0Mu
         /dFCGpQgdBkaFsbtdp0/EXzgHUuG2vPYibgirtaISH84CYNhrBiJCeVneudwMm9jAWsb
         ukRNvuaBxG7A5ho0Cw2Fu7B/G3sUnrVizGI4U1RdLrfsjOvm/i0PtPsAOw9/KuX+mJwI
         KtQqeKo2CGpncOw6cgT+1yIqrpWLFaZSCWu7z6uKZ+LOWDTDQMH/Do3l9QwxP38D0xq6
         F09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795849452; x=1796454252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/KBdkImcIIENaeq362hNd97cFg9UT738kuOmRsIPZg=;
        b=RBO5gB+iIDZ6fVkXlj7fmlC3OWuYtt3x3RksSiHYk9iFqomaYzgJ7HoVluv3gt5soQ
         WqVDunBhhUFrAzWRop3HQuk+ZHDp3CVV79SSLkFk0I3JaUdfTYD+YZ2HK9dFCTYmWyDm
         hccXSG9MLCX2tKoWc2MR9oZI7rawrTUYrh2UOhvfZrg+CQQhhHkfvshB2+upGjehPSgx
         hjxokYAPwuB/SvUXpSIIL5+IKws7kS40aF02Db1LehVoj2zkn80Pm2YhulXBAgJ7Qq+X
         EubyBlCCGFbZ96gPXiXMueJAOHbjK2GhIT57ZY2KCf0I1BxtQF+EBtYZnz8UYYaU0UQs
         cmkg==
X-Gm-Message-State: APuU4Z9E/U2p2azs735AjxoLzuMeBsBKp9i4r7+OzDBbtXHES5e2DwUm
	Ij3qCnFxl/jvm1fStCXFFocw5FzUppih9T3GNwiY7EvEKjlbTEHPHl74KVLj6w==
X-Gm-Gg: AZFdTZeOSowFzJs1JTCR6t1kockHyxut77m9w4oYPz/RyMP2KoQI03/B1U5PBMPV6vl
	qKZ77hd9Z2Cmawfug68CmWOAV3f/1fdGvi9AzMRCyl2teecEolerotPs5pj6caQLQ0fmZLcDTlY
	8ZbzvIXzVw/bWFgg9J6gt23Pnjd4qIoAYbJY10XVWGRt8AGlX2SXoXHKhBA/Ls9CwvdqLfUoekC
	EaGhbajG/Q8xpFPDZuZeKLpRP28dcPFPNIVt/fZH5ODYAQIHSq6mlLdcx63+ax95QiBVPMg1FJU
	ashC4+ZTK/a14Xz0vORrXAueVMTBDSnitn8FmMQKZyDbALNeLkjLbqxDvzb3vB7xtozJi7lzMAN
	YxKeM8C1t4+u++TcKdFw1IrshLBunAVwYz65VCexcFCGkR3oPWxFy7qAe9h7kc+1H1mwzMOonkW
	7aGUr0KdgBHIfA6OCJa4pRBws13ap9zcxcftOgIBSTOiAiqXFKrRLdOgMDt9meGq8K+8hQU+RYw
	50dpI7UASaYc3kdzD3iI9UpMrr2sJLIinYywiu9Qw3C02ZRbeQn0mi/xDPu97Hrd8FrX7WOLzSc
	Bi7/OgIKWdEUUIC6szIXTADfz50gCLI2Nx17iB2sYJnjgozBjQc=
X-Received: by 2002:a05:701b:4213:10b0:185:6c8c:d860 with SMTP id a92af1059eb24-1b5568aac8emr26049791c88.5.1795849451918;
        Fri, 27 Nov 2026 23:04:11 -0800 (PST)
Received: from tach01.nordicsemi.no ([2401:4900:1cb2:1222:8ca1:bea2:3bd1:958d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm54740763c88.4.2026.11.27.23.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:04:11 -0800 (PST)
From: Chaitanya Tata <chaitanya.mgit@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Chaitanya Tata <Chaitanya@dotstarsystems.com>
Subject: [PATCH wireless-next 0/2] wifi: make rejected UHR elements visible
Date: Sat, 28 Nov 2026 12:34:28 +0530
Message-ID: <20261128070430.3784598-1-chaitanya.mgit@gmail.com>
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

From: Chaitanya Tata <Chaitanya@dotstarsystems.com>

UHR elements whose size checks fail are dropped silently today, in
both directions. That is easy to hit while 802.11bn is still a draft
and the kernel and hostapd move between draft revisions separately.

Testing with mac80211_hwsim and hostap's test_uhr.py:

 - A kernel with the D1.4 layout rejects the UHR Operation element
   from a hostapd built for D1.5. The AP does not start, and hostapd
   only logs "Beacon set failed: -22". With patch 1 it also logs
   "kernel reports: malformed UHR operation".

 - The current kernel (D1.5) drops the UHR Capabilities element of a
   hostapd built for D1.4 (1-octet instead of 3-octet DBE Capability
   Parameters) and connects as EHT. If the AP requires UHR, the
   connection fails instead. With patch 2 the client logs "AP UHR
   capabilities missing or invalid, drop UHR".

With matching drafts on both sides, all five test_uhr.py cases pass
and neither message is printed.

Chaitanya Tata (2):
  wifi: nl80211: report why UHR capabilities or operation are invalid
  wifi: mac80211: log when an AP's UHR elements are dropped

 net/mac80211/mlme.c    | 15 +++++++++++++--
 net/wireless/nl80211.c |  8 ++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.43.0

