Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.194
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502174;
	b=uSjhwIJ8SrYHO0TldRVPqqnWvhKT69oX3KBirKfdJTLROZsYmByWIUGeT55HVd0NGd93
	 BJPsK5eSgKkdj6pk8pXnORFfIevpb1p0PMdSbn8J1a0GnS2VYPb1mAfSWBfszygZGCpYm
	 lKmYMuDEPa+l+edTxPcgXDi0uV67J5AYD5Mv+eRe04QMUepT2Cz4Z0qjLgBvkmYW2zzN0
	 VjgCz/XBym0qBJZTv2gNMrV7bH+4P742HEuLhCW+4lsL5avRFRbbhI3v/X04svSQgJG+C
	 io0XBIF5FvMYNuUkSHA8i96KuFTkiepL/392rk5fIqf8AkovjF5E/1hOIs7AJGRyzDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
	b=xLJ8FCB/XLuPFUodb8pJ1gmaLieGPfaXjFZcCBDCRo/oilMwhjZo3WQW4UzS1BLSjFPh
	 dYwXOqh7kWa3wLyXDsXndSo+D0a3aOZoitl8A6loYomHUC3uvriJ6nDVs9DXy4EVY0TWi
	 5wmwpF99syRHlgprNO80mm6db6PtBV+NDmLwbVMXMhFR+9qDxV2jfMreMajJ9OsjI9PiB
	 bBMsjFcb9RpntyKk2tr/VacBLZrjzsDiCRiEF5MB0QpsaK5y10t9+4TqbHhLUiFOZlRgJ
	 NMwMoK8bUGl0r/5Q1k8QDqVrpN588Ohlfu9nlprgv5mzYULqrcc6nf9NiotpIJhSbdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWvUjTDj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.194
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9689F606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9689F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iWvUjTDj
Received: by mail-lj1-f194.google.com with SMTP id 38308e7fff4ca-3ada7d53082so455261fa.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:49:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794502172; cv=none;
        d=google.com; s=arc-20260327;
        b=gmO8FehEjnjDANRoRCXpBMRWo/1q00r0l9a9vhRUHljY63ocKCI6t+2lvni8kAOxxD
         X5cI2min4mMrECXINY+fNO/RYTYtFzReIGa3BiuwbCWsGnoZYXYyxOZKsfWpSvlJcCRM
         rhW17rGsakVk1sjL4oMwrZHCs8mHlzYwrvHWdQz7qJpV/2IKXiTigWV0Eb52tGctu6En
         lUAuu+Y1UcEX4ETaPQDPwryM/uVas+6vf60nlzDIyC5jubSXGRi2en2ao+9DUA+BzSgN
         KQMp+rTt2IDIaiMNqPBZ0kcxhojLFVREo8dy7lG6OqcvdOtq8AkZh6sp9pHpJT3t3KmE
         A7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
        fh=YBglDtN/TJu7EsOxy2PTGDHjKAUltZI4OlFA5kr9e94=;
        b=mFkTJBrwvjEz4QsU47SWXDcuRdoYIQ8xw7gaDPXsvCe5SIfzxszM8tEZ0rRWdV9H64
         7OPFqH0Ab+YpPMzELjb3uVe9Gx7hEcvmzvL6P6BpfV/HvhubLRCX3kiucvtfrQvRM/vo
         aKO6tv08s8zvdX3Tntkh5NerRFwe+/jPdPq4E6U5Dz6or+PU1bky8zvJywXc6ns830BG
         9zBeONVL2XMacsKCCvzCEZ/qT1mUuxSdGjJPMbmEGQb4pCnQXh2UQTZu4hB3CH05dtRv
         T/w9oiD4PNY+frpdUrAHWv16gcTrT/CERjQXV9IJnPCEMwPFQKDZmrFyCJb4h3lsqvRG
         xYJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502172; x=1795106972; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
        b=iWvUjTDjYGLtoKclmoeCM4H8lhbvS8Z8CI/IKgu8Th20SScSOx/VoERtjkdVuJIy6E
         igYR6S+Mmg4SaQJX+36/uPLX0F6m4fyzGPp4aaIjPB6rWv0nf6yRGiEqlzB6gk21e/8+
         F9ZaVXRA+x1kB3exBBI+d/VBjQ9AdfI3RNeCmA6Mt+MlxGCKICpmSYEm61BizLx0VJET
         o9jejpJwgIY666PUJTkkIhRRa6v0y8M8hePPUpN5OxmfM6rfKS1FwbgG0OPvrloKLONP
         Nd1eYtjmwL7AkIwhZejecJQ7J/w02biF+kQvg7ZMXszinn4pT25jlCFLBBNhP5QcCEum
         WOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502172; x=1795106972;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9B0x6SlwXhZHGSGz1g1xDtDQcPbSiewX37Fbcqs1MEo=;
        b=qzNnm5tvJJfrahiDLHCb3jmVarpFeAX6rqkZUsB4qXGjpVYLd5LGa7mGH84x7XY9TF
         J5+TjTwVgV5KqRwGqYp2I7qAvkJjZI6TCfOOx16+U8C9iOmFFXkCuqQjiIeT2n/aatHi
         8hgMR5ZGharh5IlAeopMGyj0rRc80d5MmPsVPykGzL+I+LW4EMm1klElrzrCiRn8bBZG
         tz5S7TmhDZcGeoFBbryIwBL+ecSeObna7nIbD6JlE3ueyijZaE7un3W4vzCKPGaPcqf4
         8SF8nx18CmYEdur5NOyNeLwuaXWs62Xqu/FjZUxgih7pV9+ipE0aqH9Wz4lsr4H5YXHN
         8+Sg==
X-Gm-Message-State: APuU4Z/HIahYF9XME8DFw/8BBhhFj4nxWU8SrEpvY3SG+LN25vfOiHZ8
	b6zRgzujqB+FPMk2/mJsqnGXSG7J9uI2uuqCQrOKFrf/KdYsqC4Aj1mmoNZEje8K3l9gKpg31f0
	O67V1zRXrCJYKKvEI+M5xsOjpEsJr3pU=
X-Gm-Gg: AYBFou2hkLp/KMhBA/LM4s5RPBzpGFGzrzQDhoiSof+Zb3lWY+F8BPC/suC+NfHxtDT
	bLLhKYVO5L3lNYF+hPLZbr84/SoAc8GdhSViWt3+su4t9AsO1vnR/I+hLxhBTe4anh4DftTzHLw
	qkmnydjZkSEkpY0kJENKcV4umKYVZQYnl8dcZPvnafR+qh60r1LNXwvN3ULLlGpp5EFqQYHBGeY
	AsqddWRo6c38+Vd7hbzAsUu2e40SA3YIkVgFI61VlsS2XOb1td660ZHbIOAFyX4kVT1ZxHVJi54
	GJU0kipXHsqPE6tQQhSsO9xlh8S8s2uAtGYtTZ7kI/V8yowlG5hpG+cT9pAcnqAGf09Jvc9Dvzo
	ShAz5H7g9nZIxq5tZDKhvjR78p8Oy3BrkuehDhC8+/xOfsHAfZI3cULrlB8lxqCNBmoFEcHqSG6
	hE47D/TAesVyf0/g==
X-Received: by 2002:a05:651c:1607:b0:3a9:8775:5f11 with SMTP id
 38308e7fff4ca-3ae1bfb801amr8051251fa.4.1794502171606; Thu, 12 Nov 2026
 08:49:31 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?6ZOu?= <fengaojigui88@gmail.com>
Date: Fri, 13 Nov 2026 00:49:19 +0800
X-Gm-Features: AclHuK_rQEbphEVssARDDlFRz9NaI-h2rX0d7OAHgvFohhN8Nh_vkLD1OcPgrcA
Message-ID: <CAO-4RZ1Xu6vdLg6y74YfyT=On+Lom9L+XprpvORdXXOdOsAALA@mail.gmail.com>
Subject: [BUG] ath9k_htc: KASAN slab-use-after-free in WMI event tasklet (v7.4-rc2)
To: toke@toke.dk
Cc: linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Toke,

We found a KASAN slab-use-after-free in the ath9k_htc WMI event tasklet
on v7.4-rc2 with syzkaller:

  BUG: KASAN: slab-use-after-free in tasklet_action_common+0x2ec/0x3b0
kernel/softirq.c:988

  Allocated by task 1259:
   ath9k_init_wmi+0x49/0x320 drivers/net/wireless/ath/ath9k/wmi.c:95
   ath9k_htc_probe_device+0x203/0x2650
drivers/net/wireless/ath/ath9k/htc_drv_init.c:956
  Freed by task 1259:
   ath9k_htc_probe_device+0x292/0x2650
drivers/net/wireless/ath/ath9k/htc_drv_init.c:978

The freed object is the WMI control structure allocated by
ath9k_init_wmi() (drivers/net/wireless/ath/ath9k/wmi.c:95) during
ath9k_htc_probe_device(). The WMI event tasklet (wmi_event_tasklet,
registered by ath9k_init_wmi()) was scheduled by an incoming USB message
during probe. Subsequently, a later init step failed and the error path
(err_init -> ath9k_destroy_wmi(), htc_drv_init.c:978) freed the WMI
structure. The pending or rescheduled WMI event tasklet accessed
the freed structure, triggering the use-after-free.

Kernel/config: 7.4.0-rc2-kernsight-kasan #1, built from v7.4-rc2 with
CONFIG_KASAN=y, booted with oops=panic and panic_on_warn=1.

The crash depends on device state built up by preceding operations. The
reproducer consists of 50 priming programs and one triggering program
(51 programs in total):

  syz-execprog -procs=8 -threaded -repeat=0 -executor ./syz-executor
repro.kernsight.prog

The programs are replayed repeatedly with 8 parallel workers (-repeat=0);
the execution order is not guaranteed to be strictly serial.

In our fuzzing pipeline this reproducer was verified on a fresh VM
(reproducer pipeline outcome: confirmed=true, status=verified).

A full write-up, the reproducer and the crash artifacts are available at:

  https://github.com/Zheng-zheng-codes/ath9k-firmware-tasklet-use-after-free

Repository contents:
  - README.md                      full bug report: phenomenon, KASAN
                                   Alloc/Freed stacks, mechanism,
reproduction steps
  - reproducer/repro.kernsight.prog
                                   pipeline-verified reproducer (50 priming
                                   programs + one triggering program)
  - reproducer/repro.prog          triggering program set from the pipeline
  - reproducer/repro.priming.prog  state-priming program set (pipeline recipe)
  - kernel.config                  kernel configuration used
  - environment.txt                kernel image info (sha256), QEMU command
                                   line, syzkaller commit, reproducer command
  - logs/log-*.txt, logs/report-*.txt
                                   original syzkaller execution logs and crash
                                   reports from the fuzzing pipeline
  - logs/machineInfo-*.txt, logs/title-stat.json
                                   guest environment info and title statistics
  - logs/external-verification/    external verification serial console
                                   (contains the KASAN report)

Happy to provide the full KASAN report, kernel image, additional crash
instances or raw artifacts if useful.

Best regards,
Zheng Zheng
