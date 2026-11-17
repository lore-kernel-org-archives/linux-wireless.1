Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923315;
	b=TUiwN54Kc7lBiqfPa6/00LNsLQGuH7iif8RE7Gf1MR7CQ//B97y16DOKhSPWzevXFgCK
	 5553ewXgUb2H5tE4aGhskAVDdymPf4X5O9pz0YlN6uNk+bzE3GSVxA8SyiWlk1F2j76NL
	 xLyPsQ2ZO2EHDiCcbKPzsLu+Q3t+m8DSj6AuzVSYQkqx4Oy6HxHW5ot33nYzGGU6LrbTs
	 TdKlCbtpUsDFRoq3wRLuVLFEFkn8HvTEFbDxkAQQjoFklo/NOYw+JpdFryyRQClcCX2Bf
	 EoafM0CzWRAp0Pg5PNjvYIILh35swc2nBD7YskMSUP5B2IB914cEfUzHc3SyvRIVAyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923315;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tDOwlNUBBwdRYZAyLsugLYWbl6R/LlrxGs9sSAJDnx0=;
	b=qT9NnGXyw5OKNz6jg6X/BIEfWTUM91PQceTZVzduuWDa/jroLErd/NgVM69hcmZeTYMf
	 F1BDZMND8BKXjGrbhq/Gw3ZH8ceLZe9dxlCU5WLucMYjw+1O7q+Y76Q1jHcmTs6Upchem
	 +1Q1Rh0HBm76RvTesqWtzH6TrGF8aQc68Vmsb9czKZ6aqPGi10HIWf4mvLvqYtq4iO7BM
	 Xux1cRWVrStlWrTip1KHV4X4xkkKy7E+M709OJQ5TLtGIxmRZS66+0wM2TGqjt0z0drql
	 9WDijoW7ggOBY94r+kzH9kS15Vbi4rsL96BQbS+P2z0B+1MIQNbpemgJGkHFWRVLIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=grM8kKz0;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B538606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 13:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B538606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=grM8kKz0
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso940553a91.1
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 05:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923313; x=1795528113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDOwlNUBBwdRYZAyLsugLYWbl6R/LlrxGs9sSAJDnx0=;
        b=PDR8AjtRu84JEzV0pb0uWgShADNGbm0fFT1Eu4gr6gjpI69JwCBpKIJHSc8EuVIKDX
         TBrwBIQ/QWCtbcevXojl1MdidL0369aRjdy6XqJLuuMu2X7rZN3Z4mn8YxCQLpcxtlKQ
         paBUuvonQRkRDNSsGrif5wneB6m50lmEIu73Olhpdqnby8lslZEfQMA8uB660EWfsCLX
         3LrzWtOl0Sz3oydOwNKaNp1+Z6u31u8uSKR5TJ/IixWpdGqnX5oByGgr2XLeqAexuHQ7
         UQ+SODZUeLFyMxiGIMvZr0b3qgyWAkky6TmnkDyUEoepVCd1IQXJcDUcrAOm4Z6wmvTZ
         7z2A==
X-Forwarded-Encrypted: i=1; AL+hErEKquQtPaTKrvr11XVmETpjfCRTp7M8Of1RrrLXIJfpgXaPCJhRgqxsKvoBCVjKM2nxaLN/8yBxotlyQO/3ww==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZrgPpIgdvSPkynbl8DRXn/0LQltWQ21hNtF0dZNrNzzT2wwjI
	9h2esNqqBnztR5WOQ9KHsTOSHM2ZIVVz26f2nhrNQ4Xx0864WkPze/rYVql4SmjrrXfx1wTwIa4
	zwg3rBQ31aGtngZ7UZNq9E5+QgSz+MlHLpAw7eVim9NXXVCGlcTr1rOhi0lPFLnmXzOsG5N+nTj
	zeIbbxR62m9xLiq8iMSeGnYqGtiT1NFAK5o0ZnCOtOmaEB0ABGvuHKYX6G6sbiMj1D44fvlWwS3
	MHcJCl4ahujJ1msV9+646pDGATn
X-Gm-Gg: AZFdTZeZpwKFvCrgtaR8IJHOqi+DTTQG9igKDYAPjaEMVgvx4v8o7tMThDDHz/z1OaY
	FlMTj66GvmVPBo6gDGhkv7NFEWkluFIS/bZES6EqZdiQLLjuOM/N5Zu7ZNXemJTofaZPXxM54NQ
	qzLXh7aBBr0Bfj6rjsQPzZfjI0LxMYUEGRUWAsYKjJR58kPAjq59QEDSGLjkjJNRqnLYWKruwYi
	DZCdpaFIsHL7FU4fq9/eJfvp7aRCP/vdBtUMchm82+4xQPfPhwPZzW+9ueKrbAoINsL64VJSoJq
	/vzNtW8vLuppJrCaklKTLajBjzXzMrmNaNnWcaSZH3q4PWIZBKzzN8KR9NJeu9y7hnLLQ1Q1pPR
	QU4hDBgsT8a+juCqlqBya0g3b/xwiQFQOjEIwcySax+u+YsTRWWQzzk/ZpVzq8oY/p/VkRXU2Sr
	EwsABi2YUdlTOv98oM1HnA+81h1lTMqzsY9oweEu1Rhg==
X-Received: by 2002:a17:90b:4e8c:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3b1b0ba3320mr13441724a91.31.1794923313332;
        Tue, 17 Nov 2026 05:48:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84cacsm2058624a91.1.2026.11.17.05.48.32
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:48:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b937ecbb4so40241086d6.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794923312; x=1795528112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDOwlNUBBwdRYZAyLsugLYWbl6R/LlrxGs9sSAJDnx0=;
        b=grM8kKz0GaCHAJZ5pydjy+a+tkXkA2azsDCbRdMK4OPLlpbSEsU+iF2GUCpM1I8Zk7
         1xCbXHZ0M0zm5UUL9Qj/IJOfSkABvro3rEAeSzz9j00LV51bdkB/4avZr+FLjixo6rzI
         KppmM2lkDorHVMR0UtioNAxP4HXI0+ooFoqjE=
X-Forwarded-Encrypted: i=1; AL+hErGPWRWzLBijd6p+mdtnb+5AZm9Q4iXEPoAwYv3VID7XsNXG7puuRj+2v+3P5yPdZLnI4xewCfeqX8oTeNGyUw==@vger.kernel.org
X-Received: by 2002:a05:6214:4589:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-91f23f21dcdmr220710826d6.0.1794923311859;
        Tue, 17 Nov 2026 05:48:31 -0800 (PST)
X-Received: by 2002:a05:6214:4589:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-91f23f21dcdmr220710206d6.0.1794923311337;
        Tue, 17 Nov 2026 05:48:31 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dae6c3sm110641136d6.38.2026.11.17.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:30 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Max Engel <dev@maxengel.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH v2] wifi: brcmfmac: request bus reset when the device is unresponsive after wake
Date: Tue, 17 Nov 2026 14:48:26 +0100
Message-ID: <20261117134826.1652889-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179230294232.2815959.4255945147086159884@maxengel.com>
References: <179230294232.2815959.4255945147086159884@maxengel.com>
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

On Sun, 18 Oct 2026 05:55:42 +0000, Max Engel <dev@maxengel.com> wrote:
> That worker's only SDIO trigger today is the firmware-halt mailbox
> interrupt (HMB_DATA_FWHALT), which a chip that is off the bus can never
> deliver. Request the same reset from the KSO wake path when the failure
> is conclusive: wake direction, the wait given up with an error, and the
> CSR reading back all-ones.

[...]

> @@ -771,6 +771,20 @@ brcmf_sdio_kso_control(struct brcmf_sdio *bus, bool on)
>  	if (try_cnt > MAX_KSO_ATTEMPTS)
>  		brcmf_err("max tries: rd_val=0x%x err=%d\n", rd_val, err);
>
> +	/* A wake attempt that gives up, by exhausting the KSO retries or by
> +	 * bailing out on consecutive access errors, with the sleep CSR
> +	 * reading back all-ones means the device has dropped off the bus,
> +	 * e.g. it lost state across a system suspend despite
> +	 * keep-power-in-suspend. No in-band recovery is possible. Request
> +	 * the bus reset the firmware-halt path uses, which a device that is
> +	 * off the bus can never signal itself. Skip the coredump: it cannot
> +	 * succeed over a dead bus.
> +	 */
> +	if (on && err && rd_val == 0xff) {
> +		brcmf_err("device unresponsive after wake, requesting bus reset\n");
> +		brcmf_fw_crashed(&bus->sdiodev->func1->dev, false);
> +	}
> +
>  	if (on)
>  		sdio_retune_release(bus->sdiodev->func1);

sdio_readb() returns 0xFF whenever the CMD52 fails, so with err set rd_val is
0xff by construction. The condition therefore means "the wake loop ended with
an access error", not "the CSR read back all-ones", and it cannot tell a
device that is off the bus (-ETIMEDOUT) from e.g. a CRC error or another bus
error. Also err may stem from the final write rather than the read that gave
rd_val. A full power cycle is a heavy response, so please either narrow the
condition (e.g. on -ETIMEDOUT) or fix the comment/commit message and justify
why resetting on any access error is acceptable.

Also, the new call can be reached from the bus reset itself. The reset
worker runs brcmf_sdio_bus_reset() -> brcmf_sdiod_remove() ->
brcmf_sdio_remove() -> brcmf_detach() -> brcmf_bus_stop() ->
brcmf_sdio_bus_stop(), which wakes the device with brcmf_sdio_bus_sleep()
and so ends up in brcmf_sdio_kso_control(). On a device that is off the bus
that wake fails, and brcmf_fw_crashed() is called from the reset worker.
If remove runs at the same time, brcmf_bus_cancel_reset_work() holds
bus_reset_lock while it waits for the worker in cancel_work_sync(), and the
worker blocks on that lock in brcmf_bus_schedule_reset(): deadlock. Without
a concurrent remove the worker re-arms itself while brcmf_detach() is still
running, and the queued work then points into the brcmf_pub that
brcmf_free() releases. The data worker is fine, because remove cancels it
before taking the lock. Suggest to only request the reset when the device
is up, e.g. skip it when sdiodev->state is not BRCMF_SDIOD_DATA, which
brcmf_sdiod_remove() has cleared by then. The extra "Firmware has halted or
crashed" message printed by brcmf_fw_crashed() is a bit misleading for this
case too.

[...]

Regards,
Arend
