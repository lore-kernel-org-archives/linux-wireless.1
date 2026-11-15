Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776587;
	b=UVSeXj8OUbJz3h4+2xHtUWJ59OwT2l6A729+zp6VmxBn8iwKt8QSvrpJ9lMhw4czEE3x
	 qOqOOuKpa6qlm+JYPvSFGuBec2xVN1TMYpRta9X4nnMt7s7Sdx5mh8/gwG3+8Y0Cym2Lz
	 J5VMCNcKwmpPG7Ty4oKGc+4CEkQR094qLd66blefmzHngZHAyq7XyXwiy891B0kdU/1Os
	 4V8JD2JVT20U2JUB6geZAzl0X52Cvg8YpP2JtrG9xFOt+uUrdJOeGaoD9ftEzcVd6t4tN
	 z4fhuXeR5xxBeWJovlPxReMh5twEMh0o9h+y8YttWDQ/HFnP3EaGStI0FRuU/y3mGDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776587;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
	b=Wz6UEyPN5N3imcbycEN2/nGomN7ATjbchxw+fM/9vC9fihRBACmNl88BapiBjJpHs92M
	 6UeWSP6fie6p23l2CZ4mH4ubYDoFF9eKo8CV+ChHWr0swzGdYF2ZLoH2nXBOj0tCh/xez
	 natwuAjfvGrZf1kuDG86yr0nL71t5eqE+AJyb8LRhARdTBLJgjzsIPANqQNcUnRyn9jL4
	 niahQa6WCexkWb+v0CINjfmv8pM5oVjcb+srjHYM9PNV7XUdrp26SkrhJtkbpAeqQWmEC
	 VgOHq4QXSBq6DWClJ/hQCGtUnpzdVqjC112O7o45jRhuDFyo/DUdQ11j6/IhCIA3jLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P+YkhPYS;
	arc=none smtp.remote-ip=209.85.210.225
Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BDC606A32C
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 21:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55BDC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P+YkhPYS
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-8a39e5161c1so3232934b3a.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776587; x=1795381387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
        b=SuhE285kyPTc+9QWf+uGm7CG8iTdmEGuxIKPSUXPgRDe5zzmp0YZ84C3gRRz0Qkqkm
         KMIjZ8i7irNU3XJBaoRLNvZxR7o1xznRH0sqNSPliQ4wdFb//Qx61Pz70XUThH11Oni+
         RlCKPr+YmANlnOMfJZnJoPARQXd0OJgE2pGJizyJh/6yAbANhxOI3M/2BTCUbrofU4dP
         XQ6qNlioI0kZHnwX0nFkb8GcGm2m2z5q0to/9+E/fjrD1otHCDByJkEhFqZrLOvJo9K0
         IxH/iyEgjIeU+Dg9xsqG9MvHnv8XCXjuQ4xFtwET1ChIFhU987hA43BMfaI9OnAqY2r5
         Z+Qw==
X-Forwarded-Encrypted: i=1; AL+hErEmD6ndFl61sDaOnQDfrLWTi1Qto0K/XBhmDThlGqBI9TpMsQd5XmAQrAVdXDL83W77PKN0lLHzLMDB/luQVQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z97ZGQTlaCi94SxXyNvEqu89U4aaT68UZjIiKK3r9uDyG7t4z
	cRbCuUzSp9je84mDvbgiGS828pRjBiwc1aEX7gvHiASBBskqtuinWy3R6gg319ExbPMORTCrrFO
	xqmK4ZAax0q9Be6vurLVcFRC7pnprDyLIDSStbOdx4PTSITkSSsFPZs4udC1aDBM0ddjM3Oy7uD
	jtZPSzc/4f4ePBAEpgauSwwFdD5BmpO5AkZVn5JUzvbxPab1zz93I4v1Rqy3uPtTyad4LD8xT7O
	ean4DxY5uB82nP9KrcWnuI/v4k6
X-Gm-Gg: AYBFou3Ikvx5WUVtuDbMWR5dHY1FC2bErqGGs3bCi4KCFe9zxAONMRzKlPUQhTjdY1K
	oxoYwLaWwHYE1NfKVPaFOBiH6pysCmK6fZOSkfnXNTvNbaYOErzxwBcB9UBdmUotn7ZHP+WfZvC
	U47fyrSakR4iFHEtb9M1aTppN2vPApBNq+ARenu6R3fz6Z4pq2z5+3XLkF7x1vAtyer8oZSYv4l
	OTs1hJeDd+WhgUbRGcfqDY76tkgkxDp9pjTjT9i+QRCesgl/HlEGX35MymGzDsPF6PlYhcArbSm
	Pg6dPE1I55VTZTwDKD9KIX52dgnTlHFlMsXMBol4syfIYbPDiouD4p+U/y6LehhiDSlTcG0+oGQ
	RuQ6fzaJ3DIN7yRfNAZygYwL72ig/lyJgf3IbomFwA+vpD0d+ALfP74OanFxzNDqVLrCxRE/MGn
	7qMW+JJaZ3Tc+57/qRyNjx0l4YSEFj0h32aY3Inxk=
X-Received: by 2002:a05:6a00:f87:b0:89e:fc47:2c17 with SMTP id d2e1a72fcca58-8beb5bab2dbmr8717132b3a.19.1794776586575;
        Sun, 15 Nov 2026 13:03:06 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8bed282a9b4sm164899b3a.18.2026.11.15.13.03.04
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:06 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso623957eec.0
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 13:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776583; x=1795381383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWIlSlhDqIZVJylV02U3W5JWNr4VF81Iz41rAjFMs+U=;
        b=P+YkhPYSzjgtIYqyhXYvAz/rsuK2NUWUM/uibW8+kKIILJa7otHrwhb67uVjZymHUH
         h27G9DUzAuoh43yxm6770OxgT97MZ+ll5/Svyfk8Qi6EQN3Q9U1PgXlcaetHjrEfIr2W
         brWj2nYan2HrFcq+OkM/qMjyRV7kkhM5vpIhI=
X-Forwarded-Encrypted: i=1; AL+hErGjqSNf2pQegfNly6Xu5pzXIQJ9YUPoPylSFk/oUKDZEVNRK50tQ97d/VfTlNXuVl6DLSVLix00AHdqtW9G4A==@vger.kernel.org
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7970684eec.24.1794776583531;
        Sun, 15 Nov 2026 13:03:03 -0800 (PST)
X-Received: by 2002:a05:7300:dd03:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-37967314a08mr7970660eec.24.1794776582638;
        Sun, 15 Nov 2026 13:03:02 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:01 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Vitor Soares <ivitro@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v1] wifi: brcmfmac: skip bus_reset cancel when the work was never initialized
Date: Sun, 15 Nov 2026 22:02:50 +0100
Message-ID: <20261115210253.883721-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020203916.381637-2-ivitro@gmail.com>
References: <20261020203916.381637-2-ivitro@gmail.com>
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

On Tue, 20 Oct 2026 21:39:13 +0100, Vitor Soares <ivitro@gmail.com> wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>
> When the firmware request fails, brcmf_pcie_setup() releases its own
> driver, which runs brcmf_pcie_remove() -> brcmf_bus_cancel_reset_work().
> At that point brcmf_alloc() has set bus_if->drvr, but brcmf_attach() has
> not run, so drvr->bus_reset was never INIT_WORK()ed. cancel_work_sync()
> on the zeroed work then trips WARN_ON(!work->func) in __flush_work():

[...]

> brcmf_bus_schedule_reset() already gates on bus_reset.func for this
> reason. Apply the same check on the cancel side.
>
> Reproduced on a BCM43752 PCIe module with the firmware file absent.
> With this change the same failure path completes without the warning.
>
> Fixes: 43b25879f004 ("wifi: brcmfmac: drain bus_reset work on device removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
