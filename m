Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919931;
	b=P/IleZ9o8v6QNtfTHPAhBJ/Ex4NI1HIsmM4ZrCpX1VypaB099ImM+KDcDOsINyNHPHmz
	 3BmvqPXGp6hHTnnWpbEtuuLCjJvAITZbLU5dwIUglruSeqI49LrQehg7g6e2D2Cm6VxK1
	 Qdz5fo+Et7ozIii1QiZkLOMk6dKZsrlroNuK/y9EDI1xVsQtHlij0mBNIEFZgn34n0RAD
	 fpeTglrCEA6QdaB2eRnL2G8IXxstDWu5iwlq/rp+0V4LPlFKK+wFfrBDEaHfWO8bIGC9J
	 0AEmlnMXi8AO6HDg6VA0BsVOjQzGYnPmH32TL7m3sCaovRZX/IVt/NIKPuVKzTTv28g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919931;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
	b=MuapblFj1UdMjC2KvZyRneRznW+rMsmy7u2gB8fyz5SFJqo+8n/W+E5OBiAiyHFjBzYn
	 SmVBakmBqZddXEvn7uPlmDRhz4bBL/+Cr6LfE57RLZB9Vi3HHnEFxUfzaI0ltwFNsObJk
	 EUHf2vL8kDdjZkj5juLc/8BuUDFo/rrf4zeMFKLtXZTgjwfolkUdCwQLRqJnhh3HIHpd4
	 rd8wiBhx5c7BhyYUJUBktRPKUsz0zk2br9PQnc/nwLh+aLCU5Wz/Wc3Nt9on7ZLw+c9zC
	 Hl7OwzbwiLTAwgj4meb3gbamUOoyvmohR4qmGf0QuB9ZXoL1qx+AqgW+cz5RikJT4FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="MKF/fbwz";
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0BF606A88C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 12:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F0BF606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=MKF/fbwz
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so707557a91.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919930; x=1795524730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
        b=LOCAtMvfN3AJ6o6yOlQy1dgplp3tyVZj18E28Cehh0qhPng0iX5VI4c/eGq+vmUU3C
         +GobtizR20XOtvqx203bulL7wwJ9EC52XeKp5qBT3v7bojr4nryBUFQdiotiS1skmcWl
         Fx2PO9VW7kwcGewBAcv78csDuC6FVISQ2ZU49G/nvKx6xuqadU3u+o7l0bfZsr57SBPo
         tEIupAbpo93LIiMRAgUbHbB61pQLrowhhFxWenBMi39sAlTHQ/sQ5Lca6KBv7+KtRg9X
         WpgJ7tEtkm1u6whxTM0Bx0jrDla0fWoUSi7LmTyArejFePGav0jrNqvzZMvYETRgb0hz
         Pg4A==
X-Forwarded-Encrypted: i=1; AL+hErEkWFhMDZZxMSjgd3CvuBEK8wsQ+oYn7C5rZbHGXaiS6KIh1rZlSqgi42nSjQEYawm4ekxJE2hC3HdWAk6rfw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9UBnF3vB9cMB1XPxHHeLd9VWGjY5Er2Fayp0Gs2PMdXWN11wBe
	5tVf4n3X4aCXP72rWGLOArvu3gEB+5erGBBdS1OemsBW8AugiKSOxDuUO/TgZl39Q/OVXIiJhpY
	4ZuqHeETUNl08YA5IWWr+bElNyWQ58+3rtY4oak/rcNKgYb6ZCCTm9jDAObmPzgq5lCV4lpQfsr
	Iy4J/fZMO0H9wKdDYwGBj15FpmEVhSKq2emywp2vPDTVcjr0Tebxe5tojRiv/t6SbJB8Sz3U4Bo
	hvC69/EP9SAwlKM2uhuff6l13Vm
X-Gm-Gg: AZFdTZcHKA+1mr1k2fU+OqKE/zzKSTAhd0Qvvf1mWU64PKNU5uGhN+Igbp5sr2ACIGc
	RDfgc+Vqgou1yOY4eXU59OH8lN4jfjOqFIO7R6ahyJO4SOWdKhMkjlWDoomgpk66ZOxkbaeK6Ls
	r/LVmKZHMgNX+oBaxSOrOw2UnfniXzWAG6ssePMObvy+C38W9TNU/RWfjtY0oa8ABD2xzhX/e5V
	2rgjPja/4aM7NVWl0xwDniBNhZQyIajCsc2fSLf6GuYlyTJKRxe0/LjAeLhPlbgv+mZNPooX5Yy
	cLkyye6dwGtZR9/XWXrsTUrHKwKHYzmyJy6RSt08PRZ26nLAGRyXJ5Gt2dmNrpKrTBcaBIOILDS
	xqPclcPWqGtPGUeWGRUD4ZUq/vzidmXPF3NG/M30qNoxWzGqrr3JX6aXiOvuZP2rMWTCYzM0y6H
	H5RI2TaFuv2jZ+YwdkD777eoNBx3VF9a59u7cJnBM=
X-Received: by 2002:a17:90b:388c:b0:3b3:b92a:aff9 with SMTP id 98e67ed59e1d1-3b3b92ab483mr1366782a91.56.1794919929829;
        Tue, 17 Nov 2026 04:52:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm1902958a91.6.2026.11.17.04.52.09
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:52:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so521562885a.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794919929; x=1795524729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qF5pRgK1fLCyx67ZJUqqMabNrPbzcG9t+q8YanBUEjo=;
        b=MKF/fbwzB2M5p+UWnsuZz1nj6/+H/dolOX4WpvwdOTreXyhVAWZplZppMH7+LUaS7P
         d+cc6qbssjyaHTEvZqwMkc46SeFrsT1JBI5o9fTl6VDHNgi8hq4li+PvSTJwmdVzaRrT
         Ty+Yjz51WL6S7S8xJny9MlIK96n0lz5AxkxZU=
X-Forwarded-Encrypted: i=1; AL+hErGgdbVFL0zvM90VSlVqn38X6n2bLURPdY145DFNnF0pd74ZIR4QsBmLHYVevnOQhNedIY5zQjsLEh51AxI9OQ==@vger.kernel.org
X-Received: by 2002:a05:620a:8908:b0:93f:735:6c83 with SMTP id af79cd13be357-9494bb3caaemr2034707685a.56.1794919928606;
        Tue, 17 Nov 2026 04:52:08 -0800 (PST)
X-Received: by 2002:a05:620a:8908:b0:93f:735:6c83 with SMTP id af79cd13be357-9494bb3caaemr2034705085a.56.1794919928133;
        Tue, 17 Nov 2026 04:52:08 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c870f31sm1089421185a.27.2026.11.17.04.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:52:07 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Ragul Balaji <ragulbaby@gmail.com>
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH] wifi: brcm80211: move the USB bootloader definitions to a shared header
Date: Tue, 17 Nov 2026 13:52:04 +0100
Message-ID: <20261117125204.3992696-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112050816.2795512-1-ragulbaby@gmail.com>
References: <20261112050816.2795512-1-ragulbaby@gmail.com>
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

On Thu, 12 Nov 2026 13:08:15 +0800, Ragul Balaji wrote:
> The Broadcom USB bootloader downloads firmware the same way for other
> USB chips than the FullMAC ones of brcmfmac.  Move its commands, states,
> firmware header and response layouts from brcmfmac's usb.c to a header
> in the shared include directory, so that other drivers can use them.
>
> Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 68 +---------------
>  .../broadcom/brcm80211/include/brcm_usb_rdl.h      | 78 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 67 deletions(-)

[...]

> +#ifndef	_BRCM_USB_RDL_H_
> +#define	_BRCM_USB_RDL_H_
> +
> +#include <linux/types.h>
> +
> +#define BRCMF_POSTBOOT_ID		0xA123  /* ID to detect if dongle
> +						   has boot up */
> +
> +#define TRX_MAGIC		0x30524448	/* "HDR0" */

[...]

The move itself looks fine. Like the series "Move brcmsmac code into
brcmutil in preparation for brcmbmac" (posted a few minutes later), it is
part of the reorganization that has to go in before the brcmbmac driver
is sent again, and nothing else in the tree uses this header yet. Keeping
the brcmfmac and the brcmsmac parts as separate patches is fine, but
please send them as one series with a common cover letter, so the shared
pieces are reviewed together. Since the series then touches more than
brcmsmac, rename it to something like "Reorganize brcm80211 code into
shared directories in preparation for brcmbmac". Can you clarify the
additional sign-off from Ho Jie Feng? Did he co-author the patch or did
you use his (earlier) work?

Regards,
Arend
