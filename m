Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599900;
	b=Go40wBdQHiY7Gs2XHwdQU2UwqbIQWoXDulslKyAW5v/qOSfxNl8Sc1sEUPJcLbwWEB7P
	 ZF7YLA85nhATLMVt7435QJTlRF+RqeqynsWCDgbut106PoiUfmYPGZwDfrxO9CHEhDt0l
	 o4bBAAAuhVR/XULR+rUMNm023gauFljfp6+KlW9hUJS+FaEwol+d8Ucfkqct+85TJUgwt
	 Bp9NB8EILbAOCIHKSKHINFurSDBUgSQ997yZHE0S8JaaFwb71Xveuz93FfcMaBEjl3mrc
	 0KhhkCEKHSboHE/kA9uGhOE7cg0HZd7QphNIyI6R5powofw+UtTQpF2vseZKmdkF0Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599900;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=LVPLpuulyo/3jIEdz+KH4BiW6qG59nrBs2hN+kxxPjU=;
	b=NgmtY3PZkPoTrN9UElTDlibTR1WBO2fp3+7WhjTMoFrPhRakMMJFfSLUfrqw0iu9pqt9
	 6NPUdIt1H00pJlqjqlM/0ir+Hi4Oq3pwDZ4fRvrpPRxS6Ph67WtLx2XMe0Za5ZK6Drf6s
	 Ect29JdLDN3pcEb3wDnsifyMzyY8jCOhEsdZp3yu6O7mBOBa0X8vCASWK7MpKtoQ4FKbp
	 ujNkHGpptItfCufTtbUHXbFkiUGJQw/yznXMt1oEEjUrdnESKmKxt8qhlbIMITPD+uhYd
	 wZJdUL7db0UUzDAoIH+jA9qoixppbzaBk2jBfb7ZxTFDTCpnru0RMXY7vbDmUE0cy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YU4s6Fpd;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01F4606A323
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 09:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C01F4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YU4s6Fpd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795599900; x=1827135900;
  h=date:from:to:cc:subject:message-id;
  bh=CW8LYPwY5jYk9gPr9JmMTwM5gKGXC3pg1FKEL2kEDHQ=;
  b=YU4s6FpdHmpr1rLq1BrKyc1b2f7fxMNU/tN7ZNBwpYPR9B1/O7TVRpot
   zsfJAb2hPAhIgAzsFlbPH1VY+DsDTG/Bc1pnMKxOhAyHuSUUbEA5zKkug
   +V24yTX2yqkGkXOqNJeZt9Wrtxopa/YrNmH5k9KjqoOM3JaQH7daK83kW
   ges+bFopqCd2Lma73i8aB5OeHszRmQHYpGlLP6P/N4Mm5V5pC6i0frxfd
   yhME5E3Scy4YrCWc/WK8INDMAeZKa0+Npl5y4lW3p4YOLkY3m0zz93opl
   7BgBlogXSHLboCTkxJw4TCzAqb24pYsEfhJ9E0/lCmjI4f3522EZybRPD
   g==;
X-CSE-ConnectionGUID: vRp+tbvtQSKFUDRfcl/WUA==
X-CSE-MsgGUID: +JWff7J2Q8aTwmsRv7g7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4389770"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4389770"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 01:09:40 -0800
X-CSE-ConnectionGUID: vBS2gKeAS4qaygy82vPJ5A==
X-CSE-MsgGUID: 5ckwbIGgQjGP7eOLHZDo5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="11609199"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2026 01:09:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW90T-00000001RCu-0LmR;
	Wed, 25 Nov 2026 09:09:37 +0000
Date: Wed, 25 Nov 2026 17:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: linux-wireless@vger.kernel.org
Subject: [wireless-next:for-next] BUILD SUCCESS WITH WARNING
 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
Message-ID: <20261125170907.2lAlAIAW-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git for-next
branch HEAD: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23  MAINTAINERS: wifi: add git tree for mm81x driver

Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202611050454.85FsLtIo-lkp@intel.com

    arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gsj.dtb: pwm-fan-controller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected 32
    arch/arm/boot/dts/nuvoton/nuvoton-npcm750-evb.dtb: pwm-fan-controller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected 32
    arch/arm/boot/dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dtb: pwm-fan-controller@103000 (nuvoton,npcm750-pwm-fan): fan@1:cooling-levels:0: size is 8, expected 32
    arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey (i2c-gpio): $nodename:0: 'i2c-gpio-touchkey' does not match '^i2c(@.+|-[a-z0-9]+)?$'
    arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'touchkey@20' were unexpected)

Warning ids grouped by kconfigs:

recent_errors
`-- arm-allnoconfig
    |-- arch-arm-boot-dts-nuvoton-nuvoton-npcm730-gsj.dtb:pwm-fan-controller-(nuvoton-npcm750-pwm-fan):fan:cooling-levels:size-is-expected
    |-- arch-arm-boot-dts-nuvoton-nuvoton-npcm750-evb.dtb:pwm-fan-controller-(nuvoton-npcm750-pwm-fan):fan:cooling-levels:size-is-expected
    |-- arch-arm-boot-dts-nuvoton-nuvoton-npcm750-runbmc-olympus.dtb:pwm-fan-controller-(nuvoton-npcm750-pwm-fan):fan:cooling-levels:size-is-expected
    |-- arch-arm-boot-dts-qcom-qcom-msm8960-samsung-expressatt.dtb:i2c-gpio-touchkey-(i2c-gpio):nodename:i2c-gpio-touchkey-does-not-match-i2c(-.-a-z0-)
    |-- arch-arm-boot-dts-qcom-qcom-msm8960-samsung-expressatt.dtb:i2c-gpio-touchkey-(i2c-gpio):Unevaluated-properties-are-not-allowed-(-address-cells-size-cells-touchkey-were-unexpected)
    |-- arch-arm-boot-dts-ti-omap-am335x-boneblack-wireless.dtb:lcdc-(ti-am33xx-tilcdc):port:endpoint:reg-is-a-required-property
    |-- arch-arm-boot-dts-ti-omap-am335x-myirtech-myd.dtb:lcdc-(ti-am33xx-tilcdc):port:endpoint:reg-is-a-required-property
    `-- arch-arm-boot-dts-ti-omap-am335x-sl50.dtb:lcdc-(ti-am33xx-tilcdc):port-is-a-required-property

elapsed time: 958m

configs tested: 641
configs skipped: 107

tested configs:
alpha                              allnoconfig    gcc-16.2.0
alpha                             allyesconfig    gcc-16.2.0
alpha                                defconfig    gcc-16.2.0
alpha                 randconfig-2000-20261124    gcc-11.5.0
alpha                 randconfig-2000-20261125    gcc-8.5.0
alpha                 randconfig-2001-20261124    gcc-11.5.0
alpha                 randconfig-2001-20261125    gcc-8.5.0
alpha                 randconfig-2200-20261124    gcc-8.5.0  smatch
alpha                 randconfig-2200-20261125    gcc-10.5.0 smatch
alpha                randconfig-r2101-20261124    clang-22   cocci
alpha                randconfig-r2103-20261124    gcc-9.5.0  cocci
alpha                randconfig-r2111-20261125    gcc-13.5.0 cocci
alpha                randconfig-r2302-20261124    clang-17   sparse
alpha                randconfig-r2303-20261125    gcc-8.5.0  sparse
alpha                randconfig-r2307-20261125    clang-24   sparse
arc                               allmodconfig    clang-24
arc                                allnoconfig    gcc-16.2.0
arc                               allyesconfig    clang-24
arc                                  defconfig    gcc-16.2.0
arc                          haps_hs_defconfig    gcc-16.2.0
arc                   randconfig-1000-20261125    gcc-8.5.0
arc                   randconfig-1001-20261125    gcc-8.5.0
arc                   randconfig-2000-20261124    gcc-11.5.0
arc                   randconfig-2000-20261125    gcc-10.5.0
arc                   randconfig-2001-20261124    gcc-11.5.0
arc                   randconfig-2001-20261125    gcc-10.5.0
arc                   randconfig-2002-20261124    gcc-11.5.0
arc                   randconfig-2002-20261125    gcc-10.5.0
arc                   randconfig-2003-20261124    gcc-11.5.0
arc                   randconfig-2003-20261125    gcc-10.5.0
arc                   randconfig-2004-20261124    gcc-11.5.0
arc                   randconfig-2004-20261125    gcc-10.5.0
arc                   randconfig-2005-20261124    gcc-11.5.0
arc                   randconfig-2005-20261125    gcc-10.5.0
arc                   randconfig-2200-20261124    gcc-8.5.0  smatch
arc                   randconfig-2200-20261125    gcc-14.4.0 smatch
arc                  randconfig-r2106-20261124    clang-24   cocci
arc                  randconfig-r2107-20261125    gcc-13.5.0 cocci
arc                  randconfig-r2109-20261124    gcc-15.3.0 cocci
arc                  randconfig-r2110-20261124    clang-24   cocci
arc                  randconfig-r2110-20261125    gcc-9.5.0  cocci
arc                  randconfig-r2300-20261124    clang-17   sparse
arc                  randconfig-r2300-20261124    gcc-16.2.0 sparse
arc                  randconfig-r2304-20261124    gcc-16.2.0 sparse
arc                  randconfig-r2311-20261124    gcc-9.5.0  sparse
arm                                allnoconfig    gcc-16.2.0
arm                               allyesconfig    clang-24
arm                          assabet_defconfig    gcc-16.2.0
arm                          axm55xx_defconfig    gcc-16.2.0
arm                          bcm2835_defconfig    clang-17
arm                                  defconfig    gcc-16.2.0
arm                          lpc18xx_defconfig    clang-17
arm                          lpc32xx_defconfig    clang-17
arm                          mv78xx0_defconfig    clang-17
arm                          mv78xx0_defconfig    gcc-16.2.0
arm                           pxa168_defconfig    gcc-16.2.0
arm                           pxa3xx_defconfig    gcc-16.2.0
arm                   randconfig-1000-20261125    gcc-8.5.0
arm                   randconfig-1001-20261125    gcc-8.5.0
arm                   randconfig-1002-20261125    gcc-8.5.0
arm                   randconfig-1003-20261125    gcc-8.5.0
arm                   randconfig-2000-20261124    clang-17
arm                   randconfig-2000-20261124    gcc-8.5.0
arm                   randconfig-2000-20261125    clang-22
arm                   randconfig-2001-20261124    clang-17
arm                   randconfig-2001-20261125    clang-22
arm                   randconfig-2002-20261124    clang-17
arm                   randconfig-2002-20261124    clang-24
arm                   randconfig-2002-20261125    clang-22
arm                   randconfig-2200-20261124    clang-17   smatch
arm                   randconfig-2200-20261125    clang-21   smatch
arm                  randconfig-r2100-20261124    clang-24   cocci
arm                  randconfig-r2103-20261124    gcc-16.2.0 cocci
arm                  randconfig-r2104-20261125    clang-24   cocci
arm                  randconfig-r2107-20261124    gcc-15.3.0 cocci
arm                  randconfig-r2110-20261124    clang-24   cocci
arm                  randconfig-r2300-20261124    gcc-16.2.0 sparse
arm                  randconfig-r2300-20261125    gcc-12.5.0 sparse
arm                  randconfig-r2303-20261124    gcc-16.2.0 sparse
arm                  randconfig-r2304-20261124    gcc-16.2.0 sparse
arm                  randconfig-r2305-20261124    gcc-14.4.0 sparse
arm                  randconfig-r2305-20261125    gcc-10.5.0 sparse
arm                  randconfig-r2307-20261124    gcc-9.5.0  sparse
arm                            sama7_defconfig    clang-17
arm                           sp7021_defconfig    gcc-16.2.0
arm                            u8500_defconfig    gcc-16.2.0
arm64                             allmodconfig    clang-24
arm64                              allnoconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                                defconfig    gcc-16.2.0
arm64                 randconfig-1000-20261125    clang-24
arm64                 randconfig-1001-20261125    clang-24
arm64                 randconfig-1002-20261125    clang-24
arm64                 randconfig-1003-20261125    clang-24
arm64                 randconfig-2000-20261124    clang-17
arm64                 randconfig-2000-20261124    clang-24
arm64                 randconfig-2000-20261125    clang-22
arm64                 randconfig-2001-20261124    clang-17
arm64                 randconfig-2001-20261124    gcc-8.5.0
arm64                 randconfig-2001-20261125    clang-22
arm64                 randconfig-2002-20261124    clang-17
arm64                 randconfig-2002-20261124    clang-24
arm64                 randconfig-2002-20261125    clang-22
arm64                 randconfig-2200-20261124    gcc-16.2.0 smatch
arm64                 randconfig-2200-20261125    gcc-13.5.0 smatch
arm64                randconfig-r2101-20261124    clang-24   cocci
arm64                randconfig-r2102-20261124    clang-24   cocci
arm64                randconfig-r2107-20261124    clang-24   cocci
arm64                randconfig-r2109-20261124    clang-24   cocci
arm64                randconfig-r2111-20261124    gcc-15.3.0 cocci
arm64                randconfig-r2300-20261124    gcc-16.2.0 sparse
arm64                randconfig-r2305-20261125    gcc-12.5.0 sparse
arm64                randconfig-r2306-20261125    gcc-13.5.0 sparse
csky                              allmodconfig    gcc-16.2.0
csky                               allnoconfig    gcc-16.2.0
csky                                 defconfig    gcc-16.2.0
csky                  randconfig-1000-20261125    clang-24
csky                  randconfig-1001-20261125    clang-24
csky                  randconfig-2000-20261124    gcc-16.2.0
csky                  randconfig-2000-20261125    gcc-14.4.0
csky                  randconfig-2001-20261124    gcc-16.2.0
csky                  randconfig-2001-20261125    gcc-14.4.0
csky                  randconfig-2200-20261124    gcc-15.3.0 smatch
csky                  randconfig-2200-20261125    gcc-16.2.0 smatch
csky                 randconfig-r2101-20261124    gcc-8.5.0  cocci
csky                 randconfig-r2102-20261125    clang-24   cocci
csky                 randconfig-r2104-20261124    gcc-8.5.0  cocci
csky                 randconfig-r2105-20261124    clang-22   cocci
csky                 randconfig-r2302-20261124    gcc-14.4.0 sparse
csky                 randconfig-r2306-20261125    gcc-16.2.0 sparse
csky                 randconfig-r2307-20261125    gcc-16.2.0 sparse
hexagon                           allmodconfig    gcc-16.2.0
hexagon                            allnoconfig    gcc-16.2.0
hexagon                              defconfig    gcc-16.2.0
hexagon               randconfig-1000-20261125    gcc-11.5.0
hexagon               randconfig-1001-20261125    gcc-11.5.0
hexagon               randconfig-2000-20261124    gcc-16.2.0
hexagon               randconfig-2000-20261125    gcc-14.4.0
hexagon               randconfig-2001-20261124    gcc-16.2.0
hexagon               randconfig-2001-20261125    gcc-14.4.0
hexagon               randconfig-2200-20261125    clang-17   smatch
hexagon              randconfig-r2103-20261124    clang-22   cocci
hexagon              randconfig-r2103-20261124    clang-24   cocci
hexagon              randconfig-r2103-20261125    clang-20   cocci
hexagon              randconfig-r2106-20261124    gcc-16.2.0 cocci
hexagon              randconfig-r2107-20261124    clang-24   cocci
hexagon              randconfig-r2107-20261124    gcc-14     cocci
hexagon              randconfig-r2107-20261125    gcc-11.5.0 cocci
hexagon              randconfig-r2110-20261124    gcc-16.2.0 cocci
hexagon              randconfig-r2302-20261124    gcc-16.2.0 sparse
hexagon              randconfig-r2309-20261125    clang-24   sparse
i386                              allmodconfig    clang-22
i386                               allnoconfig    gcc-16.2.0
i386                              allyesconfig    clang-22
i386        buildonly-randconfig-1000-20261125    clang-22
i386        buildonly-randconfig-1001-20261125    clang-22
i386        buildonly-randconfig-1002-20261125    clang-22
i386        buildonly-randconfig-1003-20261125    clang-22
i386        buildonly-randconfig-1004-20261125    clang-22
i386        buildonly-randconfig-1005-20261125    clang-22
i386                                 defconfig    gcc-16.2.0
i386                  randconfig-1000-20261125    clang-22
i386                  randconfig-1001-20261125    clang-22
i386                  randconfig-1002-20261125    clang-22
i386                  randconfig-1003-20261125    clang-22
i386                  randconfig-1004-20261125    clang-22
i386                  randconfig-1005-20261125    clang-22
i386                  randconfig-1006-20261125    clang-22
i386                  randconfig-2000-20261124    clang-22
i386                  randconfig-2000-20261124    gcc-14
i386                  randconfig-2000-20261125    gcc-14
i386                  randconfig-2001-20261124    clang-22
i386                  randconfig-2001-20261124    gcc-14
i386                  randconfig-2001-20261125    gcc-14
i386                  randconfig-2002-20261124    gcc-14
i386                  randconfig-2002-20261125    gcc-14
i386                  randconfig-2003-20261124    clang-22
i386                  randconfig-2003-20261124    gcc-14
i386                  randconfig-2003-20261125    gcc-14
i386                  randconfig-2004-20261124    gcc-14
i386                  randconfig-2004-20261125    gcc-14
i386                  randconfig-2005-20261124    gcc-14
i386                  randconfig-2005-20261125    gcc-14
i386                  randconfig-2100-20261124    gcc-14     cocci
i386                  randconfig-2100-20261125    clang-22   cocci
i386                  randconfig-2101-20261124    gcc-14     cocci
i386                  randconfig-2101-20261125    clang-22   cocci
i386                  randconfig-2102-20261124    clang-22   cocci
i386                  randconfig-2102-20261124    gcc-14     cocci
i386                  randconfig-2102-20261125    clang-22   cocci
i386                  randconfig-2103-20261124    gcc-14     cocci
i386                  randconfig-2103-20261125    clang-22   cocci
i386                  randconfig-2104-20261124    gcc-12     cocci
i386                  randconfig-2104-20261124    gcc-14     cocci
i386                  randconfig-2104-20261125    clang-22   cocci
i386                  randconfig-2105-20261124    gcc-14     cocci
i386                  randconfig-2105-20261125    clang-22   cocci
i386                  randconfig-2200-20261124    clang-22   smatch
i386                  randconfig-2200-20261125    clang-22   smatch
i386                  randconfig-2300-20261124    clang-22   sparse
i386                  randconfig-2300-20261124    gcc-14     sparse
i386                  randconfig-2301-20261124    gcc-14     sparse
i386                  randconfig-2302-20261124    clang-22   sparse
i386                  randconfig-2302-20261124    gcc-14     sparse
i386                 randconfig-r2101-20261124    clang-24   cocci
i386                 randconfig-r2104-20261124    clang-22   cocci
i386                 randconfig-r2106-20261125    gcc-9.5.0  cocci
i386                 randconfig-r2109-20261124    gcc-14     cocci
i386                 randconfig-r2110-20261124    gcc-15.3.0 cocci
i386                 randconfig-r2300-20261124    gcc-14.4.0 sparse
i386                 randconfig-r2301-20261124    gcc-16.2.0 sparse
i386                 randconfig-r2303-20261124    gcc-14.4.0 sparse
i386                 randconfig-r2305-20261124    gcc-16.2.0 sparse
loongarch                         allmodconfig    clang-24
loongarch                          allnoconfig    gcc-16.2.0
loongarch                            defconfig    clang-24
loongarch             randconfig-1000-20261125    gcc-11.5.0
loongarch             randconfig-1001-20261125    gcc-11.5.0
loongarch             randconfig-2000-20261124    clang-18
loongarch             randconfig-2000-20261125    clang-19
loongarch             randconfig-2001-20261124    clang-18
loongarch             randconfig-2001-20261125    clang-19
loongarch             randconfig-2200-20261124    gcc-16.2.0 smatch
loongarch             randconfig-2200-20261125    clang-18   smatch
loongarch            randconfig-r2100-20261124    gcc-16.2.0 cocci
loongarch            randconfig-r2100-20261124    gcc-9.5.0  cocci
loongarch            randconfig-r2100-20261125    clang-20   cocci
loongarch            randconfig-r2106-20261124    gcc-15.3.0 cocci
loongarch            randconfig-r2106-20261125    gcc-11.5.0 cocci
loongarch            randconfig-r2302-20261125    gcc-12.5.0 sparse
loongarch            randconfig-r2304-20261124    gcc-14.4.0 sparse
loongarch            randconfig-r2306-20261125    clang-24   sparse
m68k                              allmodconfig    gcc-16.2.0
m68k                               allnoconfig    gcc-16.2.0
m68k                              allyesconfig    clang-24
m68k                                 defconfig    clang-24
m68k                        m5235evb_defconfig    gcc-16.2.0
m68k                  randconfig-2000-20261124    gcc-11.5.0
m68k                  randconfig-2000-20261125    gcc-8.5.0
m68k                  randconfig-2001-20261124    gcc-11.5.0
m68k                  randconfig-2001-20261125    gcc-8.5.0
m68k                  randconfig-2200-20261124    gcc-10.5.0 smatch
m68k                  randconfig-2200-20261125    gcc-15.3.0 smatch
m68k                 randconfig-r2102-20261124    gcc-9.5.0  cocci
m68k                 randconfig-r2107-20261124    clang-20   cocci
m68k                 randconfig-r2300-20261124    gcc-15.3.0 sparse
m68k                 randconfig-r2300-20261125    gcc-8.5.0  sparse
m68k                 randconfig-r2301-20261125    gcc-8.5.0  sparse
m68k                 randconfig-r2308-20261124    gcc-9.5.0  sparse
m68k                           sun3x_defconfig    clang-17
microblaze                         allnoconfig    gcc-16.2.0
microblaze                        allyesconfig    gcc-16.2.0
microblaze                           defconfig    clang-24
microblaze            randconfig-2000-20261124    gcc-11.5.0
microblaze            randconfig-2000-20261125    gcc-8.5.0
microblaze            randconfig-2001-20261124    gcc-11.5.0
microblaze            randconfig-2001-20261125    gcc-8.5.0
microblaze            randconfig-2200-20261124    gcc-8.5.0  smatch
microblaze            randconfig-2200-20261125    gcc-8.5.0  smatch
microblaze           randconfig-r2104-20261125    gcc-12.5.0 cocci
microblaze           randconfig-r2105-20261124    gcc-8.5.0  cocci
microblaze           randconfig-r2106-20261125    gcc-13.5.0 cocci
microblaze           randconfig-r2108-20261124    gcc-15.3.0 cocci
microblaze           randconfig-r2108-20261125    gcc-13.5.0 cocci
microblaze           randconfig-r2108-20261125    gcc-9.5.0  cocci
microblaze           randconfig-r2301-20261124    gcc-14.4.0 sparse
microblaze           randconfig-r2301-20261125    gcc-10.5.0 sparse
microblaze           randconfig-r2302-20261124    gcc-16.2.0 sparse
microblaze           randconfig-r2305-20261124    clang-17   sparse
microblaze           randconfig-r2305-20261125    gcc-8.5.0  sparse
microblaze           randconfig-r2307-20261124    gcc-9.5.0  sparse
microblaze           randconfig-r2309-20261124    gcc-9.5.0  sparse
microblaze           randconfig-r2310-20261125    gcc-13.5.0 sparse
mips                              allmodconfig    gcc-16.2.0
mips                               allnoconfig    gcc-16.2.0
mips                              allyesconfig    gcc-16.2.0
mips                        bmips_be_defconfig    gcc-16.2.0
mips                            ip30_defconfig    clang-17
mips                            ip30_defconfig    gcc-16.2.0
mips                       maltasmvp_defconfig    gcc-16.2.0
mips                  randconfig-2000-20261124    gcc-16.2.0
mips                  randconfig-2000-20261125    gcc-16.2.0
mips                  randconfig-2001-20261124    gcc-16.2.0
mips                  randconfig-2001-20261125    gcc-16.2.0
mips                  randconfig-2002-20261124    gcc-16.2.0
mips                  randconfig-2002-20261125    gcc-16.2.0
mips                  randconfig-2200-20261124    clang-20   smatch
mips                  randconfig-2200-20261125    clang-24   smatch
mips                 randconfig-r2100-20261124    gcc-16.2.0 cocci
mips                 randconfig-r2101-20261124    gcc-16.2.0 cocci
mips                 randconfig-r2102-20261124    clang-24   cocci
mips                 randconfig-r2105-20261125    clang-24   cocci
mips                 randconfig-r2108-20261125    gcc-11.5.0 cocci
mips                 randconfig-r2110-20261124    gcc-14     cocci
mips                 randconfig-r2311-20261125    gcc-16.2.0 sparse
mips                          rt305x_defconfig    gcc-16.2.0
nios2                             allmodconfig    clang-20
nios2                              allnoconfig    clang-24
nios2                                defconfig    clang-24
nios2                 randconfig-1000-20261125    gcc-11.5.0
nios2                 randconfig-1001-20261125    gcc-11.5.0
nios2                 randconfig-2000-20261124    clang-18
nios2                 randconfig-2000-20261125    clang-19
nios2                 randconfig-2001-20261124    clang-18
nios2                 randconfig-2001-20261125    clang-19
nios2                 randconfig-2200-20261124    gcc-11.5.0 smatch
nios2                 randconfig-2200-20261125    gcc-8.5.0  smatch
nios2                randconfig-r2101-20261125    clang-20   cocci
nios2                randconfig-r2104-20261124    gcc-16.2.0 cocci
nios2                randconfig-r2104-20261124    gcc-9.5.0  cocci
nios2                randconfig-r2104-20261125    clang-20   cocci
nios2                randconfig-r2105-20261125    clang-20   cocci
nios2                randconfig-r2108-20261124    clang-20   cocci
nios2                randconfig-r2109-20261125    gcc-13.5.0 cocci
nios2                randconfig-r2111-20261124    clang-24   cocci
nios2                randconfig-r2111-20261124    gcc-14     cocci
nios2                randconfig-r2111-20261125    gcc-9.5.0  cocci
nios2                randconfig-r2305-20261124    gcc-15.3.0 sparse
nios2                randconfig-r2306-20261124    gcc-9.5.0  sparse
nios2                randconfig-r2307-20261125    gcc-13.5.0 sparse
nios2                randconfig-r2308-20261125    gcc-16.2.0 sparse
openrisc                          allmodconfig    clang-20
openrisc                           allnoconfig    clang-24
openrisc                             defconfig    gcc-16.2.0
openrisc              randconfig-2000-20261124    gcc-16.2.0
openrisc              randconfig-2000-20261125    gcc-16.2.0
openrisc              randconfig-2001-20261124    gcc-16.2.0
openrisc              randconfig-2001-20261125    gcc-16.2.0
openrisc              randconfig-2002-20261124    gcc-16.2.0
openrisc              randconfig-2002-20261125    gcc-16.2.0
openrisc              randconfig-2200-20261124    gcc-11.5.0 smatch
openrisc              randconfig-2200-20261125    gcc-10.5.0 smatch
openrisc             randconfig-r2102-20261124    clang-22   cocci
openrisc             randconfig-r2103-20261124    gcc-8.5.0  cocci
openrisc             randconfig-r2105-20261124    gcc-16.2.0 cocci
openrisc             randconfig-r2108-20261124    gcc-16.2.0 cocci
openrisc             randconfig-r2110-20261125    gcc-11.5.0 cocci
openrisc             randconfig-r2111-20261124    clang-24   cocci
openrisc             randconfig-r2304-20261124    clang-17   sparse
openrisc             randconfig-r2310-20261125    clang-24   sparse
parisc                            allmodconfig    gcc-16.2.0
parisc                             allnoconfig    clang-24
parisc                            allyesconfig    clang-17
parisc                               defconfig    gcc-16.2.0
parisc                randconfig-1000-20261125    clang-24
parisc                randconfig-1001-20261125    clang-24
parisc                randconfig-2000-20261124    clang-18
parisc                randconfig-2000-20261125    clang-19
parisc                randconfig-2001-20261124    clang-18
parisc                randconfig-2001-20261125    clang-19
parisc                randconfig-2200-20261124    gcc-9.5.0  smatch
parisc                randconfig-2200-20261125    gcc-12.5.0 smatch
parisc               randconfig-r2105-20261124    clang-24   cocci
parisc               randconfig-r2300-20261125    gcc-10.5.0 sparse
parisc               randconfig-r2301-20261124    gcc-15.3.0 sparse
parisc               randconfig-r2301-20261125    gcc-12.5.0 sparse
parisc               randconfig-r2304-20261125    gcc-12.5.0 sparse
parisc               randconfig-r2304-20261125    gcc-8.5.0  sparse
parisc               randconfig-r2308-20261124    gcc-9.5.0  sparse
parisc64                             defconfig    clang-24
powerpc                           allmodconfig    gcc-16.2.0
powerpc                            allnoconfig    clang-24
powerpc                  canyonlands_defconfig    gcc-16.2.0
powerpc                  mpc836x_rdk_defconfig    gcc-16.2.0
powerpc               randconfig-1000-20261125    clang-24
powerpc               randconfig-1001-20261125    clang-24
powerpc               randconfig-2000-20261124    clang-17
powerpc               randconfig-2000-20261124    clang-24
powerpc               randconfig-2000-20261125    gcc-9.5.0
powerpc               randconfig-2001-20261124    clang-24
powerpc               randconfig-2001-20261124    gcc-10.5.0
powerpc               randconfig-2001-20261125    gcc-9.5.0
powerpc               randconfig-2002-20261124    clang-24
powerpc               randconfig-2002-20261125    gcc-9.5.0
powerpc               randconfig-2200-20261124    clang-21   smatch
powerpc               randconfig-2200-20261125    gcc-11.5.0 smatch
powerpc              randconfig-r2100-20261124    gcc-8.5.0  cocci
powerpc              randconfig-r2105-20261124    clang-24   cocci
powerpc              randconfig-r2106-20261124    clang-20   cocci
powerpc              randconfig-r2106-20261124    clang-24   cocci
powerpc              randconfig-r2304-20261124    gcc-15.3.0 sparse
powerpc              randconfig-r2311-20261125    gcc-13.5.0 sparse
powerpc                      tqm8555_defconfig    clang-17
powerpc                          wii_defconfig    gcc-16.2.0
powerpc64             randconfig-1000-20261125    clang-24
powerpc64             randconfig-1001-20261125    clang-24
powerpc64             randconfig-2000-20261124    clang-24
powerpc64             randconfig-2000-20261125    gcc-9.5.0
powerpc64             randconfig-2001-20261124    clang-22
powerpc64             randconfig-2001-20261124    clang-24
powerpc64             randconfig-2001-20261125    gcc-9.5.0
powerpc64             randconfig-2002-20261124    clang-24
powerpc64             randconfig-2002-20261125    gcc-9.5.0
powerpc64             randconfig-2200-20261124    gcc-12.5.0 smatch
powerpc64             randconfig-2200-20261125    gcc-13.5.0 smatch
powerpc64            randconfig-r2102-20261124    gcc-8.5.0  cocci
powerpc64            randconfig-r2105-20261124    gcc-16.2.0 cocci
powerpc64            randconfig-r2105-20261125    gcc-12.5.0 cocci
powerpc64            randconfig-r2108-20261124    clang-24   cocci
powerpc64            randconfig-r2110-20261124    clang-24   cocci
powerpc64            randconfig-r2303-20261124    clang-17   sparse
riscv                             allmodconfig    clang-24
riscv                              allnoconfig    clang-24
riscv                             allyesconfig    clang-24
riscv                                defconfig    gcc-16.2.0
riscv              nommu_k210_sdcard_defconfig    gcc-16.2.0
riscv                 randconfig-1000-20261125    gcc-8.5.0
riscv                 randconfig-1001-20261125    gcc-8.5.0
riscv                 randconfig-2000-20261124    gcc-16.2.0
riscv                 randconfig-2000-20261125    gcc-13.5.0
riscv                 randconfig-2001-20261124    gcc-16.2.0
riscv                 randconfig-2001-20261125    gcc-13.5.0
riscv                 randconfig-2002-20261124    gcc-16.2.0
riscv                 randconfig-2002-20261125    gcc-13.5.0
riscv                 randconfig-2003-20261124    gcc-16.2.0
riscv                 randconfig-2003-20261125    gcc-13.5.0
riscv                 randconfig-2004-20261124    gcc-16.2.0
riscv                 randconfig-2004-20261125    gcc-13.5.0
riscv                 randconfig-2005-20261124    gcc-16.2.0
riscv                 randconfig-2005-20261125    gcc-13.5.0
riscv                 randconfig-2200-20261124    gcc-14.4.0 smatch
riscv                 randconfig-2200-20261125    gcc-8.5.0  smatch
riscv                randconfig-r2102-20261124    gcc-16.2.0 cocci
riscv                randconfig-r2106-20261124    clang-24   cocci
riscv                randconfig-r2107-20261124    clang-24   cocci
riscv                randconfig-r2109-20261125    gcc-11.5.0 cocci
riscv                randconfig-r2109-20261125    gcc-9.5.0  cocci
riscv                randconfig-r2111-20261124    clang-20   cocci
riscv                randconfig-r2303-20261124    gcc-15.3.0 sparse
riscv                randconfig-r2305-20261124    gcc-16.2.0 sparse
riscv                randconfig-r2311-20261124    gcc-9.5.0  sparse
riscv                randconfig-r2311-20261125    clang-24   sparse
s390                              allmodconfig    clang-17
s390                               allnoconfig    clang-24
s390                              allyesconfig    gcc-16.2.0
s390                                 defconfig    gcc-16.2.0
s390                  randconfig-1000-20261125    gcc-8.5.0
s390                  randconfig-1001-20261125    gcc-8.5.0
s390                  randconfig-2000-20261124    clang-24
s390                  randconfig-2000-20261125    clang-24
s390                  randconfig-2001-20261124    clang-24
s390                  randconfig-2001-20261125    clang-24
s390                  randconfig-2002-20261124    clang-24
s390                  randconfig-2002-20261125    clang-24
s390                  randconfig-2003-20261124    clang-24
s390                  randconfig-2003-20261125    clang-24
s390                  randconfig-2004-20261124    clang-24
s390                  randconfig-2004-20261125    clang-24
s390                  randconfig-2005-20261124    clang-24
s390                  randconfig-2005-20261125    clang-24
s390                  randconfig-2200-20261124    clang-24   smatch
s390                  randconfig-2200-20261125    gcc-15.3.0 smatch
s390                 randconfig-r2101-20261125    clang-24   cocci
s390                 randconfig-r2102-20261125    gcc-12.5.0 cocci
s390                 randconfig-r2103-20261125    gcc-12.5.0 cocci
s390                 randconfig-r2104-20261124    clang-24   cocci
s390                 randconfig-r2106-20261124    gcc-14     cocci
s390                 randconfig-r2110-20261124    clang-20   cocci
s390                 randconfig-r2111-20261124    gcc-16.2.0 cocci
s390                 randconfig-r2111-20261125    gcc-11.5.0 cocci
s390                 randconfig-r2308-20261125    gcc-13.5.0 sparse
s390                 randconfig-r2310-20261124    gcc-9.5.0  sparse
sh                                allmodconfig    gcc-16.2.0
sh                                 allnoconfig    clang-24
sh                                allyesconfig    clang-17
sh                                   defconfig    gcc-14
sh                    randconfig-1000-20261125    gcc-8.5.0
sh                    randconfig-1001-20261125    gcc-8.5.0
sh                    randconfig-2000-20261124    gcc-11.5.0
sh                    randconfig-2000-20261125    gcc-14.4.0
sh                    randconfig-2001-20261124    gcc-11.5.0
sh                    randconfig-2001-20261125    gcc-14.4.0
sh                    randconfig-2002-20261124    gcc-11.5.0
sh                    randconfig-2002-20261125    gcc-14.4.0
sh                    randconfig-2003-20261124    gcc-11.5.0
sh                    randconfig-2003-20261125    gcc-14.4.0
sh                    randconfig-2004-20261124    gcc-11.5.0
sh                    randconfig-2004-20261125    gcc-14.4.0
sh                    randconfig-2005-20261124    gcc-11.5.0
sh                    randconfig-2005-20261125    gcc-14.4.0
sh                    randconfig-2200-20261124    gcc-16.2.0 smatch
sh                    randconfig-2200-20261125    gcc-14.4.0 smatch
sh                   randconfig-r2100-20261125    gcc-12.5.0 cocci
sh                   randconfig-r2302-20261124    gcc-15.3.0 sparse
sh                   randconfig-r2302-20261125    gcc-10.5.0 sparse
sh                   randconfig-r2303-20261125    gcc-12.5.0 sparse
sh                   randconfig-r2305-20261124    gcc-16.2.0 sparse
sh                   randconfig-r2309-20261124    gcc-9.5.0  sparse
sh                   randconfig-r2309-20261125    gcc-16.2.0 sparse
sh                            se7343_defconfig    gcc-16.2.0
sh                            se7780_defconfig    gcc-16.2.0
sh                         sh7757lcr_defconfig    gcc-16.2.0
sh                             shmin_defconfig    gcc-16.2.0
sparc                              allnoconfig    clang-24
sparc                                defconfig    gcc-16.2.0
sparc                 randconfig-1000-20261125    gcc-12
sparc                 randconfig-1001-20261125    gcc-12
sparc                 randconfig-2000-20261124    gcc-8.5.0
sparc                 randconfig-2000-20261125    gcc-8.5.0
sparc                 randconfig-2001-20261124    gcc-8.5.0
sparc                 randconfig-2001-20261125    gcc-8.5.0
sparc                 randconfig-2200-20261124    gcc-11.5.0 smatch
sparc                 randconfig-2200-20261125    gcc-14.4.0 smatch
sparc                randconfig-r2102-20261124    gcc-16.2.0 cocci
sparc                randconfig-r2103-20261124    clang-24   cocci
sparc                randconfig-r2104-20261124    gcc-16.2.0 cocci
sparc                randconfig-r2108-20261124    clang-24   cocci
sparc                randconfig-r2109-20261124    clang-24   cocci
sparc                randconfig-r2109-20261124    gcc-16.2.0 cocci
sparc                randconfig-r2301-20261124    gcc-16.2.0 sparse
sparc                randconfig-r2302-20261125    gcc-8.5.0  sparse
sparc                randconfig-r2303-20261124    gcc-16.2.0 sparse
sparc                randconfig-r2303-20261125    gcc-10.5.0 sparse
sparc64                           allmodconfig    clang-20
sparc64                              defconfig    gcc-14
sparc64               randconfig-1000-20261125    gcc-12
sparc64               randconfig-1001-20261125    gcc-12
sparc64               randconfig-2000-20261124    gcc-8.5.0
sparc64               randconfig-2000-20261125    gcc-8.5.0
sparc64               randconfig-2001-20261124    gcc-8.5.0
sparc64               randconfig-2001-20261125    gcc-8.5.0
sparc64               randconfig-2200-20261124    clang-24   smatch
sparc64               randconfig-2200-20261125    gcc-15.3.0 smatch
sparc64              randconfig-r2100-20261125    clang-24   cocci
sparc64              randconfig-r2102-20261125    clang-20   cocci
sparc64              randconfig-r2104-20261124    clang-24   cocci
sparc64              randconfig-r2105-20261124    gcc-9.5.0  cocci
sparc64              randconfig-r2108-20261124    gcc-14     cocci
sparc64              randconfig-r2109-20261124    clang-20   cocci
sparc64              randconfig-r2306-20261124    gcc-9.5.0  sparse
sparc64              randconfig-r2310-20261124    gcc-9.5.0  sparse
um                                allmodconfig    clang-17
um                                 allnoconfig    clang-24
um                                allyesconfig    gcc-16.2.0
um                                   defconfig    gcc-14
um                              i386_defconfig    gcc-14
um                    randconfig-1000-20261125    gcc-12
um                    randconfig-1001-20261125    gcc-12
um                    randconfig-2000-20261124    gcc-8.5.0
um                    randconfig-2000-20261125    gcc-8.5.0
um                    randconfig-2001-20261124    gcc-8.5.0
um                    randconfig-2001-20261125    gcc-8.5.0
um                    randconfig-2200-20261124    gcc-14     smatch
um                    randconfig-2200-20261125    clang-17   smatch
um                   randconfig-r2100-20261124    clang-22   cocci
um                   randconfig-r2100-20261124    clang-24   cocci
um                   randconfig-r2101-20261124    gcc-9.5.0  cocci
um                   randconfig-r2101-20261125    gcc-12.5.0 cocci
um                   randconfig-r2102-20261124    clang-24   cocci
um                   randconfig-r2103-20261124    gcc-16.2.0 cocci
um                   randconfig-r2103-20261125    clang-24   cocci
um                   randconfig-r2301-20261124    gcc-16.2.0 sparse
um                   randconfig-r2304-20261125    gcc-10.5.0 sparse
um                   randconfig-r2308-20261125    clang-24   sparse
um                   randconfig-r2310-20261125    gcc-16.2.0 sparse
um                            x86_64_defconfig    gcc-14
x86_64                            allmodconfig    clang-22
x86_64                             allnoconfig    clang-24
x86_64                            allyesconfig    clang-22
x86_64      buildonly-randconfig-1000-20261125    clang-22
x86_64      buildonly-randconfig-1001-20261125    clang-22
x86_64      buildonly-randconfig-1002-20261125    clang-22
x86_64      buildonly-randconfig-1003-20261125    clang-22
x86_64      buildonly-randconfig-1004-20261125    clang-22
x86_64      buildonly-randconfig-1005-20261125    clang-22
x86_64                               defconfig    gcc-14
x86_64                                   kexec    clang-22
x86_64                randconfig-1000-20261125    clang-22
x86_64                randconfig-1001-20261125    clang-22
x86_64                randconfig-1002-20261125    clang-22
x86_64                randconfig-1003-20261125    clang-22
x86_64                randconfig-1004-20261125    clang-22
x86_64                randconfig-1005-20261125    clang-22
x86_64                randconfig-2000-20261124    clang-22
x86_64                randconfig-2000-20261124    gcc-14
x86_64                randconfig-2000-20261125    gcc-14
x86_64                randconfig-2001-20261124    clang-22
x86_64                randconfig-2001-20261124    gcc-14
x86_64                randconfig-2001-20261125    gcc-14
x86_64                randconfig-2002-20261124    gcc-14
x86_64                randconfig-2002-20261125    gcc-14
x86_64                randconfig-2003-20261124    clang-22
x86_64                randconfig-2003-20261124    gcc-14
x86_64                randconfig-2003-20261125    gcc-14
x86_64                randconfig-2004-20261124    gcc-14
x86_64                randconfig-2004-20261125    gcc-14
x86_64                randconfig-2005-20261124    gcc-14
x86_64                randconfig-2005-20261125    gcc-14
x86_64                randconfig-2100-20261124    gcc-14     cocci
x86_64                randconfig-2100-20261125    clang-22   cocci
x86_64                randconfig-2101-20261124    gcc-14     cocci
x86_64                randconfig-2101-20261125    clang-22   cocci
x86_64                randconfig-2102-20261124    gcc-14     cocci
x86_64                randconfig-2102-20261125    clang-22   cocci
x86_64                randconfig-2103-20261124    gcc-14     cocci
x86_64                randconfig-2103-20261125    clang-22   cocci
x86_64                randconfig-2104-20261124    clang-22   cocci
x86_64                randconfig-2104-20261124    gcc-14     cocci
x86_64                randconfig-2104-20261125    clang-22   cocci
x86_64                randconfig-2105-20261124    gcc-14     cocci
x86_64                randconfig-2105-20261125    clang-22   cocci
x86_64                randconfig-2200-20261124    gcc-14     smatch
x86_64                randconfig-2200-20261125    gcc-14     smatch
x86_64                randconfig-2300-20261124    gcc-14     sparse
x86_64                randconfig-2301-20261124    gcc-14     sparse
x86_64                randconfig-2302-20261124    gcc-14     sparse
x86_64               randconfig-r2107-20261124    gcc-14     cocci
x86_64               randconfig-r2109-20261124    clang-24   cocci
x86_64               randconfig-r2110-20261124    gcc-14     cocci
x86_64               randconfig-r2300-20261124    clang-22   sparse
x86_64               randconfig-r2304-20261124    clang-22   sparse
x86_64                                rhel-9.4    clang-22
x86_64                            rhel-9.4-bpf    clang-22
x86_64                            rhel-9.4-bpf    gcc-14
x86_64                           rhel-9.4-func    clang-22
x86_64                     rhel-9.4-kselftests    clang-22
x86_64                          rhel-9.4-kunit    clang-22
x86_64                          rhel-9.4-kunit    gcc-14
x86_64                            rhel-9.4-ltp    clang-22
x86_64                            rhel-9.4-ltp    gcc-14
x86_64                           rhel-9.4-rust    clang-22
x86_64                           rhel-9.4-rust    clang-22
xtensa                             allnoconfig    clang-24
xtensa                            allyesconfig    clang-20
xtensa                           iss_defconfig    gcc-16.2.0
xtensa                randconfig-1000-20261125    gcc-12
xtensa                randconfig-1001-20261125    gcc-12
xtensa                randconfig-2000-20261124    gcc-16.2.0
xtensa                randconfig-2000-20261125    gcc-14.4.0
xtensa                randconfig-2001-20261124    gcc-16.2.0
xtensa                randconfig-2001-20261125    gcc-14.4.0
xtensa                randconfig-2200-20261124    gcc-9.5.0  smatch
xtensa                randconfig-2200-20261125    gcc-16.2.0 smatch
xtensa               randconfig-r2101-20261124    gcc-16.2.0 cocci
xtensa               randconfig-r2107-20261124    gcc-16.2.0 cocci
xtensa               randconfig-r2107-20261125    gcc-9.5.0  cocci
xtensa               randconfig-r2108-20261124    clang-24   cocci
xtensa               randconfig-r2110-20261125    gcc-13.5.0 cocci
xtensa               randconfig-r2111-20261124    clang-24   cocci
xtensa               randconfig-r2301-20261124    clang-17   sparse
xtensa               randconfig-r2309-20261125    gcc-13.5.0 sparse

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
