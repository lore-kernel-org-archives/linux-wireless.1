Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557316;
	b=aaMFjPGkIWy6qawwWaXtYaooMQ/XC/GIDNyclTMzIBSBTkoq8yp1Uj2jbY9qq2UROD06
	 pnHLFiEWT33tUIWmu4CIQS8cJnYJyZSgwP4upsRmkY0DVsq9WtpJg3BwbLDqSRGGt3QUd
	 ajORGsu7mwxIsZfi0nH3j3+RUHw8r9iiCHh8PgQ3a3tPpyvs7ohVUM9IcZbCgWJLUkjbD
	 87eA8a0GG0jbmCiGy5az2xkc+LHNOU9CDuYiwgU8cOB6MBe14Iy117sskbk5Jk5pHAna8
	 3/suAvDKngg6yK60QSdpZb2nv1U43QvajpBCB0YYc455FAuet/x24KEXx5WYcnnRh2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5csoxHKOkY5K+kJz5xigygYh8Wk0Ea6DPUeqKveh4oQ=;
	b=nidfuSJF5jyvGwz3rvnH0mkz9glKA8qDAMyh/620h1hZXsU3hEqcJwFnUg3aqpe4sFiM
	 ed6qTm52Hf2IS73lkKmeq+hv+2ttUXncrSvKmNoEDu8e3UGrGxaWdCHROHfbch5UikwaA
	 EOzsP2e2KwypTXNsmwYgbLOJ1sly/E8X+F0A42RJ1HClSyTLE3tKJxBYoOyrDZBImSjee
	 sRDNKk3Cow68JWushVxY+j+M8BqVL1NkENUZRZBP/wUd3GUouti4pDEGocPWcoiwHGPn+
	 y6TaLrSe4Kse9bzznEJlsevfVbEoDOi6BHQVbbR4DbqUZekDg8MzmTvwrOHJN9v/IEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cHL6RRUf;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D052606A321
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D052606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cHL6RRUf
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1213259a91.3
        for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 00:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557315; x=1795162115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5csoxHKOkY5K+kJz5xigygYh8Wk0Ea6DPUeqKveh4oQ=;
        b=cHL6RRUfe+9UEQf6h6JrYzSiw0t0luooxb60FJQjiHQ5+Uie0FHmSEflOKbsUdxBTB
         VTBOR6M43zwEkJxu2uMnqofyrBB4ZNniYAec087TD0uQUpNGhB/HifTauFRwYahyJaSK
         zBqKGHlaCZ7SdDTNHD2vHTGg9kb9WuPv/hOTESh/UjZF6PrFV7S9erOkm+gWp6cNP/vl
         LW7AMT50amxhcuhSBIjmEkhuB9lOpU9EcJanqRD7aFxxC3MiETNFh4URlSDg4jJekphp
         +4JJr2b+ZskZjwrPSYwrshNxU1OaaDlfKbXQLxagynk/nLSLPY5WiEROBpMP9fJzCVN7
         dngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557315; x=1795162115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5csoxHKOkY5K+kJz5xigygYh8Wk0Ea6DPUeqKveh4oQ=;
        b=Yd54H7RPBNUPUGRV3e405MGBLVDjG00fLpSwOqlLsALb2Q4jNyzhqxoqa5y6I/qAxs
         Z2wvJQaFa6TxfD5By77KuAr+8gszGt+z4r+kiP0TCfHBIytAxya28U/8kY65/ylq7r1k
         QfCMq+prlwwa8kiM94HCvi6IEdmyj62Wm/cFbpq6PcsT3Kej3KSRcAkeXC530I55Bn+4
         C0uijD4WMy1wGk/4j380aDI22vyGud10lZe7VIETop2eHmG1jT3LFt4nsgDdH7Zdqhqt
         Xp761fEX/sNdmhf9r2JQtssHE41BeMDXLCtBTnhWl8DU6R988qUjXAi1BSnB6ujgDio9
         r0wA==
X-Forwarded-Encrypted: i=1; AL+hErFO6yVKpA8VJytOKxbQqRvEyvx5wbViRbF9wR545Z7IPMOEEQtFPiNmo3lf7ma/0cn+2icDD/4+f+zQ2Dxirg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DneO0oQXNUZWU3AlPHG/kfuzZGi/P15waoRLdN0xJZdU+PAST
	NFWMVxyEYch/4PFyx7tK3pLgxdwpfSDdufuPfwAWa6RZaL2Aq4AEyh8N
X-Gm-Gg: AYBFou2iHQ01ez5g9v6jS8g18x7P1M64NA4Zo3Bpiej6ZsljaEbO0kbDpVdBr4YruYr
	NwIYetrPYEGkc50vGn2mSxqOdiGyDPupxZKl77I6OaxKVEat9Snk705HOJbBU6NLOBNf3LhVTBl
	kz9GvdJq/YqXyR6Vnlq070xbftdYGUl2Mrb3rHlxraeVEXYr/L2EvWs9yZA2HWu5vJpfCn8Ligm
	0rap7JZLrt08xuiWEfOl8JPF37Hmg7Y7qXzYqP3di4kNMbDb1p0NtsJJsctEwcgqZKQXqblgW9p
	2lrB2FD4KVHsYQbjJg2hRB56sfRdIOOKXYu9FQZcKR97Coi3dc28sGJPoTYMRc5mtoABOdbLDkB
	7DLtR5S1gjcTNLlhHPqtUg0Y+p8SBQFYd6VzpUumaL4YhNQY730hUiqAl/lWJaz6Iw0q/7DguYg
	RWUYCak/feSccU9paStb3g0oMMplDsUQOp8LE+sSMYForwK6rLYz1GmlUN8qtEM61vs1ZtfZOMm
	1tpNJlQC4O+nhr3D88bevblFnh545FMQYMmB4TXmyTt6/BRY6kyjKN5jpuYeiAAvJ0feH48asIO
	jvAcEGnvsaOAGvrgroEeDcLh8dJihVN06KhOstQwlFJxVtZfiJAjDp2O8JeTV3tYmgMgzLcHkjb
	1jM+JeUyeK9FcjDfta5VdFcdDkp/JN1eweC0+DmGGYulrKSpxYr5l0ztPvwbiEA==
X-Received: by 2002:a17:90b:3d44:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b1b0cac9bcmr1635031a91.41.1794557315458;
        Fri, 13 Nov 2026 00:08:35 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d282fdsm8593956a91.14.2026.11.13.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:08:34 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	"Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>,
	"Berg, Johannes" <johannes.berg@intel.com>,
	linux-wireless@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] iwlwifi IO_PAGE_FAULT and Master Disable Timed Out
Date: Fri, 13 Nov 2026 17:08:29 +0900
Message-ID: <20261113080830.1459856-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e320fab5-d4d4-40fd-b032-d64554e5c0b0@leemhuis.info>
References: <amzVtgQb2p-_nShU@debian.local> <DS0PR11MB78800B96A0FE637DC5390E4AA3D62@DS0PR11MB7880.namprd11.prod.outlook.com> <e320fab5-d4d4-40fd-b032-d64554e5c0b0@leemhuis.info>
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

Hello Miri,

The same happens on a Dell Latitude 9420 (Intel AX210, firmware
89.123cf747.0) with Intel VT-d, on 7.4-rc1. It shows up when iwlwifi
stops the device, on driver unload and also once at probe and once on
suspend entry:

  DMAR: [DMA Read NO_PASID] Request device [0000:a4:00.0] fault addr 0xfd8ed000 [fault reason 0x06] PTE Read access is not set
  iwlwifi 0000:a4:00.0: Master Disable Timed Out, 100 usec

ty-a0-gf-a0-89.ucode has the TLV version 0x00000059, so
IWL_UCODE_MAJOR() gives 0 and the "<= 77" check turns the reset
handshake off.

Your "wifi: iwlwifi: mvm: properly check the FW version" fixes the
unload case here. Unloading and reloading iwlmvm and iwlwifi 50 times:

  without the patch: 18 of 50 unloads hit the fault and the timeout
  with the patch:     0 of 50

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I could not find the patch in next-20261112 or in the wireless trees
yet. The check also went to 6.18.y as 9dca67624721.

I ran these with Claude Code (Claude Opus 5.5).

Best regards,
HyeongJun An
