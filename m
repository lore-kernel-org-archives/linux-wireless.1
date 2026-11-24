Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551261;
	b=J9XKCyNPVmos5hNkI/xgFRyjuc7YjiH57Y1g55xFVwVMty5ELuMXIQ9MopjyLEQkFaye
	 0lGKT1rF8oYyAGqf8u2XrocC64cwC8MkuDj4L/813wjewWvS4Pj0YdGit/HTE3WhFBXzW
	 mdYO+5Bvgq6wqHC/XpFONV6K4grnhwOrA7ZJckvTH0JCHMImipav2OFh9X6MURlZyw39X
	 acsb7c9LWvZ31DkdgXjXyFGFFmJCVATWueuyoA07ZBNN0jrS7Fdr6dzK9v5l1TTijZNDN
	 gmXM7Qz50XuDttkmuSRY++bhfFtr3+xWyLPdjprq6xLzyG0B8pbYVI/aK3gep0213tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551261;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
	b=lJwOJQ6Sh8fftLSAXSKHLjgDeOxePfrjrkzSat8tAWIT8jjvCsIhYrW/pNGTIMKaeMKo
	 jLoGG3XMuM7+TrsR/pIh1Md2M1QDzzDw1PdWNTg2D2RIOk879bCp2iIv7fiB0K//qIZOa
	 EQzNvCAYu8RQzrjw4uSjERR2VmSgTyA6YUra91YLD4GutpKN+uFOCbmYvwaIUNkpPPnZD
	 I9zlnd2IbMe18oHCX/ME5buYE1mAniYw6d+wPI9LVpfAPdl3YXLnjBNOPaW0z4PA/gPLT
	 VgRJnfHlnrG7Kon5M+Ogg7LX8U52JLGXfwr1DgPf+Ija1CdB5V/qghua8+/JtX94jWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbbfkcCM;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35005606A69F
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35005606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=BbbfkcCM
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f0481b35c9so28602445ad.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551257; x=1796156057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
        b=LZAfN76vNOJBzBRDQXroUbB243LjQEsU6enGiR4ml+Szkn1cYhZ1jvvMX+V6ymECwH
         5tdWeYHlWhOczzxcoorTZ23YUf695MI/5tT67TxUDUtGJ51GPpCOEkh9AH1RSBRGjqLj
         k6O53px22IuT8r1GLLxtRjGBphzc0ZExeT2ef2E/f5lTBBPtkJItNz+YK6KgdOtTzMIm
         wT6AzNfMeV+K68BkuxLnJjE31xNMt0w4l9nHomt+F5SCDaoBpCLLsPPUxqUzrYwMiXFV
         fRPE/PzQsBEwXl7ELBT9VrueXT+OuZQCqAhg80xvsOTuW97LkgQ63stDxT6CYzh8CWIf
         OXCQ==
X-Gm-Message-State: APuU4Z/YmXX1lJOatM07AzZrNLX4rhnEwWqiuqvcu5yI/1TFrowMVDc4
	jqUG9ZcfwOKPty/yqM9SFu5aGgJ1GDGQK6x3xc8sl5TXskKyFyW0UVM8MKbkJyO2EWIsMi9pNLq
	j7bn97QzkoWn5HVq1tnQtZJxIh+xVaBTEMMmJVBHhcqY4ZdP92Y8puU5r+uEz+thPtQz2YgcRkK
	XptWyqbfAlfn+1cjCWegFal14ndX+z0fBFj6PvUHV0NNxpsN2gbA6M+TlR5wEoO6kgeAt2i+Dfu
	XSNzMVLvukAHFo0fH+bPcG52e4N
X-Gm-Gg: AZFdTZflZ/8nrcmX5NPujDIMQNPWJNgqMwl8LHwNlzm9Icu+s+zOIARjsz1o5ngdGw3
	bR4SZuHEMZF9layOdtoCFZAkT9GvrYeET7zXLZS71WNp1tPUu8MNplmzZbklgeVLjKNZTrJ+iFg
	LK+kU+k2/U+tMTUa+UinqDXR8dySTLkpj/fj2zB6I+8xMqYypJqdoFmJyumN8vQx0C7M59yfcEA
	spUU7JNuW8kNX9594cHrIjaTjT+eAMMI5YY1Jw2w19bMah030YKblA5FomsOVWMSgUjg53m+fqu
	H093MZCbBi+VKEhVtGkTgj7GW7MmetiFzSWulTEzLQlqzGdHXBK7k25rpaRy5dxL1S9rE6v+Cgs
	cW8lGyL+9X9Be9RI8yIw1K1MOXRZ2g6hbxQAgJTxSnk5ir9KKOiyUdx+uVj2pofttcoN7uTMbxt
	00dZ38SJfWGX7i8DfA8tq3vFqDiQoysKW9PQprGbo+Ag==
X-Received: by 2002:a17:902:e74c:b0:2e2:d834:a40f with SMTP id d9443c01a7336-2f03f0c1a98mr143091335ad.9.1795551257475;
        Tue, 24 Nov 2026 12:14:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f03f10d2afsm2538815ad.40.2026.11.24.12.14.17
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92111028a03so94647226d6.0
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551256; x=1796156056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twk8JHdUg2LSIv8pIS4vKgK5KN9CfO+IKyyNnrXVF2k=;
        b=BbbfkcCMYzwowtg+cSH+l8MLWSBokcmpoSHueXc3gv3ApTm1NApN4TXvxK50UpYxXw
         WtKiZsfD3TNGvS7IXGcXarIxUGU5OgwQqRo5UvIdMNoMCK7llIiLUPO2PN1Foe1LNSTs
         BywoHox0a3hT4n9eurhFhO5cu3bZdmqgMltBQ=
X-Received: by 2002:a05:6214:2dc6:b0:921:3573:1b25 with SMTP id 6a1803df08f44-92135731bb2mr286489256d6.27.1795551256091;
        Tue, 24 Nov 2026 12:14:16 -0800 (PST)
X-Received: by 2002:a05:6214:2dc6:b0:921:3573:1b25 with SMTP id 6a1803df08f44-92135731bb2mr286488826d6.27.1795551255663;
        Tue, 24 Nov 2026 12:14:15 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:15 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:02 +0100
Message-ID: <20261124201402.3499613-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-5-rosenp@gmail.com>
References: <20261111042554.232998-5-rosenp@gmail.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:51 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> Replace the separately allocated default_bss pointer with a
> directly embedded struct brcms_bss_info in brcms_c_info,
> removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
>  .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
>  .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
>  3 files changed, 16 insertions(+), 23 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
