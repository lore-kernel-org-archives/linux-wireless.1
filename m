Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530948;
	b=yCgofdkPlQrn0wZp4ccwG2bBlma8iGovRfD1dDGRssbB2+psHou4Tz69slo18ppQ0L1N
	 tJE3nnpMpuwEHkEptqPTjtDUbQaA/2e92B512zmNfzwfuiINoUUvpZenlv8CPZ8ZluFP8
	 txXq4c713WcWcwQQa10okScz5fB7qgt7w+FlVTpzTvBTICpxbliEJpmjuv5u0FQXaMZ4B
	 e8pQD/JtmPu6yYdtJwSDvB1aB4t4NmdcEEqw1+Z4zbf/qC2QXAKGDFW+GSGWozVVs0e22
	 doipNLq+oHLn25uyqTiEYqtmCEOyYyPaKh14VJNU2AtmD6m+Wj6asYzjH8swwdYOYLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530948;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CkMiBgcE3vAhCfh9bKhA+i+oWDh3NeCVBAeKE0Za5zs=;
	b=sGe+2baHHQXq1XnTkoMsJBrdnSFsBP5Nq3t0kgHcvw4VCLhTpw0hJ+HT19emu95aakb0
	 b6UT+KrmIoHcLUV7bTfmjR73bYoamzLn/KMlbvJHNIPXCCXj5d55dTuJ8qMa4k+yOZm1p
	 24VqDvFh6Agazs474WbwWtMdtF2WQsdZMYUZfLoABxdKRXnQI+6+c79kEPomX6PZZ8A7H
	 w+2Lf8GxQknTIdIhtNM7Im6kLlDJeK1wom9KasNvM8PbUmUrXSW8RV5ljfvcX+ELHDEiy
	 XGD0u+D1r7IWRDSNBHslHLkdMiL+AnZisnd7XLzIGb+ZUigvi3zApynMvon8urCG8MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QnVZn8d0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79715606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QnVZn8d0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8CD1F000C4;
	Tue, 24 Nov 2026 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530948;
	bh=CkMiBgcE3vAhCfh9bKhA+i+oWDh3NeCVBAeKE0Za5zs=;
	h=From:To:Cc:Subject:Date;
	b=QnVZn8d06t9er9qDx9eqfMUlHbanwFBbAm2YsuZa5AxF0Utf3cEnQ+TcaxI1316le
	 W2NA3SYCVXqWgeAbLxaNy7N/TZbObvMYIousicY5TDugAs5T9kDQheMl7ftPKf9BhN
	 0YuoGpKb4ukdGYFtTPYUUkH9r2gU9X6dvOQ7UlW1FS9Naz7gOEJnhyOCOwFFWM9pNE
	 /NX5YkyIw4XV9OIfEpxT7kVyjo8z1fQMSixp5fs05gZ7qCIPtBnmJDJFQhdT8OZTAk
	 +lGG+b7tO/ms5PVi1wYA1qNkvmIHuHHSVXc5xkCXjffUv1tp0GRLVJudFJC7aVCPhv
	 C1l05YpXVwuOA==
From: Arnd Bergmann <arnd@kernel.org>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>,
	Dan Callaghan <dan.callaghan@morsemicro.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Arien Judge <arien.judge@morsemicro.com>,
	James Herbert <james.herbert@morsemicro.com>,
	Ayman Grais <ayman.grais@morsemicro.com>,
	Andrew Pope <andrew.pope@morsemicro.com>,
	Bassem Dawood <bassem@morsemicro.com>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: mm81x: stop using linux/gpio.h
Date: Tue, 24 Nov 2026 15:34:59 +0100
Message-ID: <20261124143538.3253500-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

The header is being replaced with linux/gpio/consumer.h, which
is already included by the driver. Remove the #include statement
so we can delete the old header.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This was previously part of the patch to remove the header,
but we ended up splitting that up again.
---
 drivers/net/wireless/morsemicro/mm81x/hw.c   | 1 -
 drivers/net/wireless/morsemicro/mm81x/yaps.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/net/wireless/morsemicro/mm81x/hw.c b/drivers/net/wireless/morsemicro/mm81x/hw.c
index 9293f4094db1..e48eaf151faa 100644
--- a/drivers/net/wireless/morsemicro/mm81x/hw.c
+++ b/drivers/net/wireless/morsemicro/mm81x/hw.c
@@ -7,7 +7,6 @@
 #include <linux/stringify.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
-#include <linux/gpio.h>
 #include "hif.h"
 #include "mac.h"
 #include "bus.h"
diff --git a/drivers/net/wireless/morsemicro/mm81x/yaps.c b/drivers/net/wireless/morsemicro/mm81x/yaps.c
index 2d1728c1a6de..a843c1c16216 100644
--- a/drivers/net/wireless/morsemicro/mm81x/yaps.c
+++ b/drivers/net/wireless/morsemicro/mm81x/yaps.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2017-2026 Morse Micro
  */
-#include <linux/gpio.h>
 #include <linux/random.h>
 #include <linux/timer.h>
 #include <linux/bitops.h>
-- 
2.53.0

