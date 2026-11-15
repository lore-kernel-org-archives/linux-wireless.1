Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776590;
	b=m69S8BYJ9U1tg8OQpxPHTzgrF93fG9aqts9vpEq4qtltFV+PvedeG8yl4Y4Sl8ZRemNv
	 XU90IOYwpIZdHJdnUq6R0NHEUpDbdoJQlzs3Rb5VAT5mqPIqjTAp5+TIZTkK3CFxBCXsi
	 KFvCiFhLiiGTjCuQvrH3x/eupG7K0NDj6anoGkm6zFjUYRQxQ6zPrqb60z3AtbXT2cnPs
	 C7PN0kAUcqKlodjNY8TfHUggouBaELlEXuYsgkOLziAZDeb0euczkw7OmsW3H9tNlY7ty
	 3WQUrbUYaz12K7gi/Pp1GK9izJJnd/gAfBldXiIifMu7I5RwxoL5AEiGXmM9NfTsoEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776590;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WMpc7PEPJ4pVi8lRW2CSE/ADEkhF3E+dsHR3/w5sDac=;
	b=2RpmAjynsxLLAenO8KdjESUEEp7WlqwKv4izBuTPnKNa/fuQ0+sJRoHAU6bAYU0hqz/1
	 bwPy/Wl1UL8vBnhjlko5XzSYYoAsjHAnXHm1OWoWN7aiDnyQzUHRq9zKM4JhfjHZfZEHS
	 Thspy67nILbz0IoOivmS8922HxcTNIQJyyvW5tQGB8a2xTbZqB+WseCs8SWYkoaSksBK0
	 NSvMxxdF/mX7IhgZ3E31sBwl3hZaVsAnauyAAzPp1RtMsGtMJBDPPdS7X4FF/G+wxHXCz
	 hccTs5ji9/3BUVomkUsxQAwNvxTIPHuS1KSsbLfYO3BsheT+I2ewg04zzMhz538+/eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e9ZNRrjh;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB042606A337
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB042606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=e9ZNRrjh
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b15e46698aso2224754a91.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776589; x=1795381389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMpc7PEPJ4pVi8lRW2CSE/ADEkhF3E+dsHR3/w5sDac=;
        b=BzK/PZlU49Y9e07XdSV0mc1M+G6IavY55c2tip/scATCqQ+WbtlW376R2JeHnEWip3
         9EaLi3A+vcyNsbK5AS+skpBhqBHmCHkYV+V3YvkoGmA9+UMgtj666Qcn/vWrJOLfE28w
         G8Oo1jOwwn3IQlNBskSbwTXWWpAo9BRhAfA6XA9YMIuTrsDYz1qyAqhYvaK8+tiUvNis
         9GP3bRdS1mZra5pdAbNbm9U+KZ89WHiejYse4GqRhdM5TMl+a2d8Fx58l3GvqhjZ6nTH
         F5IqItrq7RMdPRliZnm7scD8pEF//GbyjFwHydAjUbWd7LTtYn7z1Df/71T3MZxLwboJ
         ufmA==
X-Forwarded-Encrypted: i=1; AL+hErEfuhr/b3kpLwzNWvFA07Poc3pn3VT7yZUWtZC5CNenFSXClv8UIuQrPsjI+FMVvxyVk2Fq9taQAgk6/euCWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/kQNNrL1f4uCrJDW6can57tg0AyrtdZQXn1+FGMZVtO7VgxJc0
	zEOG/Q3yF/Gq/7tAl45HB9PEXvnc18emD0wKX/kpWdK+vzfYjje2r4zyMhKYfJoRaXNN0p78AJP
	q7drqkuaPqbiFlwfLPGd4L0jscHjFnEpN5eUTxpqeTjAL9TquuqQNthEUbNt1UsPHHQhupA/zTD
	I0hjqs6F4dDMYTtaTRHIQPlfpBgtghJQb54H3/FxJpD3vctbZLL6g8JDiD771iDjfabvSb+eQyp
	fkoaYTy4//yXzXVJ8Zr+4MAK3rE
X-Gm-Gg: AYBFou0MAHhBSEJ3DTX1aytJNpsE3CtfzlBPD/SjB1TRlHQ3y1wIjttTmcRthM8is/9
	oaccAxur5WRl9KYP20GDdT5FDEKFDw0VWHR3d1CKS+IQpVABQ1A9bO/wZhBR8JhB7z/vB0ZwZoS
	UAtIDtq7r5Jm05wUJyaC8+55UhGlzN0uZiFD+R4+U/1aciSPC9JUpsvVdoKw6jVNEspTN6+T0y9
	IT9Frsqbt/pbtuvXMduBdE8QYlErWwE3X4GdRpVBk3w9hRlrH/vrSejzYvMkBX2Q5VaGYNx4UP8
	UGWiT50WIhyJO5ON0h1Z1ROpYs/WkEXW9LjGpQCS789cVnrV4hMAiaOxonZIAhiGs3lRKYTjOMI
	C5Sa1dqRlo4859MzSXFELflNy/RcBeo8j5TOswVJfohTUe1p7XCS4uJlguL3sAMOcKMcGuKJngE
	mePcki+e04SUoG/y8kT1G2xlm/nGDH6UBcRYUCiB0=
X-Received: by 2002:a17:90b:5684:b0:3ae:521e:767f with SMTP id 98e67ed59e1d1-3b1b0a49a8fmr7382634a91.36.1794776589009;
        Sun, 15 Nov 2026 13:03:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e80bsm10617942a91.5.2026.11.15.13.03.07
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so7597343eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776586; x=1795381386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMpc7PEPJ4pVi8lRW2CSE/ADEkhF3E+dsHR3/w5sDac=;
        b=e9ZNRrjhXabqPXfhh9Q0TK4VoB0twGbqfKDfYZPBPba7u9YFeQt6lGS7nXZdnExD6J
         ygk+B8677ycyXgCq4TCTmA/rr67Kt1bH3rVsdWLVnQkk1kUzZyMqAbaQu4m4dTK83ced
         1fjkFEx3nhl9AOIRmr+8dF9wgLZS5bclwvU6o=
X-Forwarded-Encrypted: i=1; AL+hErFRQrPLYkTkn36JBGTXA30gF/Wc4ORHsx3/agPrTtAVwMEPLtUJ3OtDHsH0XUG+9wGskUHL6DoiLKpr3I6kBg==@vger.kernel.org
X-Received: by 2002:a05:7300:e9cd:10b0:379:7251:9a1b with SMTP id 5a478bee46e88-3797251ad11mr10224683eec.21.1794776585816;
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
X-Received: by 2002:a05:7300:e9cd:10b0:379:7251:9a1b with SMTP id 5a478bee46e88-3797251ad11mr10224666eec.21.1794776585241;
        Sun, 15 Nov 2026 13:03:05 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:04 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sergey Armodin <dolph-in@yandex.ru>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Angel Lindo <angellindo@gmail.com>
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: pcie: restore FEM control pin mode on Apple BCM43602
Date: Sun, 15 Nov 2026 22:02:51 +0100
Message-ID: <20261115210253.883721-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261101172011.1591620-1-dolph-in@yandex.ru>
References: <20261101172011.1591620-1-dolph-in@yandex.ru>
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

On Mon, 2 Nov 2026 00:20:11 +0700, Sergey Armodin <dolph-in@yandex.ru> wrote:
> On a MacBookPro14,3 with a BCM43602 (14e4:43ba, subsystem 106b:0173),
> 5 GHz stops working once the chip has been reset to its power-on
> state, which happens over S3 while running on battery.

[...]

> Set the bit, if it is clear, before downloading the firmware, but only
> for the MacBookPro13,3, MacBookPro14,2 and MacBookPro14,3 subsystem
> IDs.

[...]

> Tested-by: Angel Lindo <angellindo@gmail.com> # MacBookPro14,3
> Signed-off-by: Sergey Armodin <dolph-in@yandex.ru>
> Tested-by: BJ Hinkle <bjhinkle@gmail.com> # MacBookPro14,2
> Tested-by: Alex McCubbin <alex@mccubbin.info> # MacBookPro13,3
> ---
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
